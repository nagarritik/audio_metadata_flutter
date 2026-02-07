package com.ritiknagar.audio_metadata_flutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AudioMetadataFlutterPlugin */
class AudioMetadataFlutterPlugin :
    FlutterPlugin,
    MethodCallHandler {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "audio_metadata_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
        if (call.method == "getMetadata") {
            val filePath = call.argument<String>("filePath")
            if (filePath == null) {
                result.error("INVALID_ARGUMENT", "File path is null", null)
                return
            }
            
            try {
                val map = getMetadata(filePath)
                result.success(map)
            } catch (e: Exception) {
                result.error("METADATA_ERROR", e.message, null)
            }
        } else {
            result.notImplemented()
        }
    }

    private fun getMetadata(filePath: String): Map<String, Any?> {
        val retriever = android.media.MediaMetadataRetriever()
        try {
            retriever.setDataSource(filePath)
            
            val metadata = HashMap<String, Any?>()
            
            metadata["title"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_TITLE)
            metadata["artist"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_ARTIST)
            metadata["album"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_ALBUM)
            metadata["albumArtist"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST)
            metadata["author"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_AUTHOR)
            metadata["writer"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_WRITER)
            metadata["composer"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_COMPOSER)
            metadata["genre"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_GENRE)
            metadata["date"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_DATE)
            metadata["year"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_YEAR)
            metadata["trackNumber"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)
            metadata["mimetype"] = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_MIMETYPE)
            
            val durationStr = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_DURATION)
            metadata["duration"] = durationStr?.toLongOrNull()
            
            val bitrateStr = retriever.extractMetadata(android.media.MediaMetadataRetriever.METADATA_KEY_BITRATE)
            metadata["bitrate"] = bitrateStr?.toIntOrNull()
            
            val artwork = retriever.embeddedPicture
            metadata["artwork"] = artwork
            
            return metadata
        } catch (e: Exception) {
            throw e
        } finally {
             try {
                retriever.release()
            } catch (e: Exception) {
                // Ignore
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}

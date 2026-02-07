import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'src/audio_metadata.dart';
import 'audio_metadata_flutter_platform_interface.dart';

/// An implementation of [AudioMetadataFlutterPlatform] that uses method channels.
class MethodChannelAudioMetadataFlutter extends AudioMetadataFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('audio_metadata_flutter');

  @override
  Future<AudioMetadata?> getMetadata(String filePath) async {
    final result = await methodChannel.invokeMethod<Map<Object?, Object?>>(
      'getMetadata',
      {'filePath': filePath},
    );
    if (result == null) {
      return null;
    }
    return AudioMetadata.fromMap(result);
  }
}

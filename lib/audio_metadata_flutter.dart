/// A Flutter plugin for extracting metadata from audio files on Android.
///
/// This library provides the [AudioMetadataFlutter] class to retrieve metadata
/// such as title, artist, album, duration, and artwork from local audio files.

library audio_metadata_flutter;

import 'audio_metadata_flutter_platform_interface.dart';
import 'src/audio_metadata.dart';

export 'src/audio_metadata.dart';

/// A Flutter plugin to extract metadata from audio files on Android.
class AudioMetadataFlutter {
  /// Extracts metadata from the audio file at the given [filePath].
  ///
  /// Returns `null` if the file could not be read or if no metadata was found.
  Future<AudioMetadata?> getMetadata(String filePath) {
    return AudioMetadataFlutterPlatform.instance.getMetadata(filePath);
  }
}

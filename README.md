# audio_metadata_flutter

A Flutter plugin to extract metadata from audio files on Android.

This plugin uses Android's `MediaMetadataRetriever` to extract metadata such as title, artist, album, duration, artwork, and more from audio files.

## Features

- Extract metadata from local audio files.
- Supports retrieval of:
    - Title
    - Artist
    - Album
    - Album Artist
    - Author
    - Writer
    - Composer
    - Genre
    - Date
    - Year
    - Track Number
    - Duration
    - Bitrate
    - MimeType
    - Artwork (embedded picture)

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  audio_metadata_flutter: ^1.0.0
```

## Usage

```dart
import 'package:audio_metadata_flutter/audio_metadata_flutter.dart';

// Create an instance of the plugin
final audioMetadata = AudioMetadataFlutter();

// Get metadata from a file path
final metadata = await audioMetadata.getMetadata('/path/to/your/audio/file.mp3');

if (metadata != null) {
  print('Title: ${metadata.title}');
  print('Artist: ${metadata.artist}');
  print('Duration: ${metadata.duration}');
  
  // Access artwork if available
  if (metadata.artwork != null) {
    // Use Image.memory(metadata.artwork!) to display
  }
}
```

## Android Setup

This plugin requires a minimum Android SDK version of 21.

Ensure you have the necessary permissions to access the files you are trying to read metadata from (e.g., `READ_EXTERNAL_STORAGE` or focused storage access).

## License

MIT License


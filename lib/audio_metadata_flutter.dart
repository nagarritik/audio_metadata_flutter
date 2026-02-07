import 'audio_metadata_flutter_platform_interface.dart';
import 'src/audio_metadata.dart';

export 'src/audio_metadata.dart';

class AudioMetadataFlutter {
  Future<AudioMetadata?> getMetadata(String filePath) {
    return AudioMetadataFlutterPlatform.instance.getMetadata(filePath);
  }
}


import 'audio_metadata_flutter_platform_interface.dart';

class AudioMetadataFlutter {
  Future<String?> getPlatformVersion() {
    return AudioMetadataFlutterPlatform.instance.getPlatformVersion();
  }
}

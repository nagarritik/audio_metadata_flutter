import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audio_metadata_flutter_method_channel.dart';
import 'src/audio_metadata.dart';

abstract class AudioMetadataFlutterPlatform extends PlatformInterface {
  /// Constructs a AudioMetadataFlutterPlatform.
  AudioMetadataFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static AudioMetadataFlutterPlatform _instance =
      MethodChannelAudioMetadataFlutter();

  /// The default instance of [AudioMetadataFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelAudioMetadataFlutter].
  static AudioMetadataFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AudioMetadataFlutterPlatform] when
  /// they register themselves.
  static set instance(AudioMetadataFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<AudioMetadata?> getMetadata(String filePath) {
    throw UnimplementedError('getMetadata() has not been implemented.');
  }
}

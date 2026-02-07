import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'audio_metadata_flutter_platform_interface.dart';

/// An implementation of [AudioMetadataFlutterPlatform] that uses method channels.
class MethodChannelAudioMetadataFlutter extends AudioMetadataFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('audio_metadata_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

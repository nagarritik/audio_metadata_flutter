import 'package:flutter_test/flutter_test.dart';
import 'package:audio_metadata_flutter/audio_metadata_flutter.dart';
import 'package:audio_metadata_flutter/audio_metadata_flutter_platform_interface.dart';
import 'package:audio_metadata_flutter/audio_metadata_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAudioMetadataFlutterPlatform
    with MockPlatformInterfaceMixin
    implements AudioMetadataFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AudioMetadataFlutterPlatform initialPlatform = AudioMetadataFlutterPlatform.instance;

  test('$MethodChannelAudioMetadataFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAudioMetadataFlutter>());
  });

  test('getPlatformVersion', () async {
    AudioMetadataFlutter audioMetadataFlutterPlugin = AudioMetadataFlutter();
    MockAudioMetadataFlutterPlatform fakePlatform = MockAudioMetadataFlutterPlatform();
    AudioMetadataFlutterPlatform.instance = fakePlatform;

    expect(await audioMetadataFlutterPlugin.getPlatformVersion(), '42');
  });
}

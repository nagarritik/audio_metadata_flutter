import 'package:flutter_test/flutter_test.dart';
import 'package:audio_metadata_flutter/audio_metadata_flutter.dart';
import 'package:audio_metadata_flutter/audio_metadata_flutter_platform_interface.dart';
import 'package:audio_metadata_flutter/audio_metadata_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAudioMetadataFlutterPlatform
    with MockPlatformInterfaceMixin
    implements AudioMetadataFlutterPlatform {
  @override
  @override
  Future<AudioMetadata?> getMetadata(String filePath) {
    return Future.value(AudioMetadata(title: 'Test Title'));
  }
}

void main() {
  final AudioMetadataFlutterPlatform initialPlatform =
      AudioMetadataFlutterPlatform.instance;

  test('$MethodChannelAudioMetadataFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAudioMetadataFlutter>());
  });

  test('getMetadata', () async {
    AudioMetadataFlutter audioMetadataFlutterPlugin = AudioMetadataFlutter();
    MockAudioMetadataFlutterPlatform fakePlatform =
        MockAudioMetadataFlutterPlatform();
    AudioMetadataFlutterPlatform.instance = fakePlatform;

    final metadata = await audioMetadataFlutterPlugin.getMetadata('dummy_path');
    expect(metadata?.title, 'Test Title');
  });
}

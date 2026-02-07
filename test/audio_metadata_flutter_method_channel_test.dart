import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:audio_metadata_flutter/audio_metadata_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAudioMetadataFlutter platform =
      MethodChannelAudioMetadataFlutter();
  const MethodChannel channel = MethodChannel('audio_metadata_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          if (methodCall.method == 'getMetadata') {
            return {'title': 'Test Title'};
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getMetadata', () async {
    final metadata = await platform.getMetadata('dummy_path');
    expect(metadata?.title, 'Test Title');
  });
}

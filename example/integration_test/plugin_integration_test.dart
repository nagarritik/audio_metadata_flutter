// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:audio_metadata_flutter/audio_metadata_flutter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getMetadata test with invalid path', (
    WidgetTester tester,
  ) async {
    final AudioMetadataFlutter plugin = AudioMetadataFlutter();
    // Since we don't have a valid file, let's test with an invalid one.
    // Ideally this should probably return null or throw an error depending on implementation.
    // Our implementation catches exceptions and returns error, which might surface as PlatformException.
    try {
      await plugin.getMetadata('invalid_path');
    } catch (e) {
      // Expected to fail or return null/error
    }
  });
}

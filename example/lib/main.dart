import 'package:flutter/material.dart';
import 'package:audio_metadata_flutter/audio_metadata_flutter.dart';

void main() => runApp(const MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _info = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadMetadata();
  }

  Future<void> _loadMetadata() async {
    // 1. Create plugin instance
    final audioMetadata = AudioMetadataFlutter();

    // 2. Get metadata (Use a real path from your device)
    final data = await audioMetadata.getMetadata(
      '/storage/emulated/0/Download/sample.mp3',
    );

    // 3. Update UI
    setState(() {
      _info = 'Title: ${data?.title}\nArtist: ${data?.artist}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plugin Example')),
      body: Center(child: Text(_info, textAlign: TextAlign.center)),
    );
  }
}

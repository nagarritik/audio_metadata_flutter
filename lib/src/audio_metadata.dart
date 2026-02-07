import 'dart:typed_data';

class AudioMetadata {
  final String? title;
  final String? artist;
  final String? album;
  final String? albumArtist;
  final String? author;
  final String? writer;
  final String? composer;
  final String? genre;
  final String? date;
  final String? year;
  final String? trackNumber;
  final int? duration;
  final int? bitrate;
  final String? mimetype;
  final Uint8List? artwork;

  AudioMetadata({
    this.title,
    this.artist,
    this.album,
    this.albumArtist,
    this.author,
    this.writer,
    this.composer,
    this.genre,
    this.date,
    this.year,
    this.trackNumber,
    this.duration,
    this.bitrate,
    this.mimetype,
    this.artwork,
  });

  factory AudioMetadata.fromMap(Map<Object?, Object?> map) {
    return AudioMetadata(
      title: map['title'] as String?,
      artist: map['artist'] as String?,
      album: map['album'] as String?,
      albumArtist: map['albumArtist'] as String?,
      author: map['author'] as String?,
      writer: map['writer'] as String?,
      composer: map['composer'] as String?,
      genre: map['genre'] as String?,
      date: map['date'] as String?,
      year: map['year'] as String?,
      trackNumber: map['trackNumber'] as String?,
      duration: map['duration'] as int?,
      bitrate: map['bitrate'] as int?,
      mimetype: map['mimetype'] as String?,
      artwork: map['artwork'] as Uint8List?,
    );
  }

  @override
  String toString() {
    return 'AudioMetadata(title: $title, artist: $artist, album: $album, duration: $duration)';
  }
}

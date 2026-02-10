import 'dart:typed_data';

/// A class that represents metadata extracted from an audio file.
class AudioMetadata {
  /// The title of the audio track.
  final String? title;

  /// The artist of the audio track.
  final String? artist;

  /// The album containing the audio track.
  final String? album;

  /// The artist of the album.
  final String? albumArtist;

  /// The author of the audio track.
  final String? author;

  /// The writer of the audio track.
  final String? writer;

  /// The composer of the audio track.
  final String? composer;

  /// The genre of the audio track.
  final String? genre;

  /// The date the audio track was recorded or released.
  final String? date;

  /// The year the audio track was released.
  final String? year;

  /// The track number of the audio track.
  final String? trackNumber;

  /// The duration of the audio track in milliseconds.
  final int? duration;

  /// The bitrate of the audio track.
  final int? bitrate;

  /// The MIME type of the audio track.
  final String? mimetype;

  /// The embedded artwork image data.
  final Uint8List? artwork;

  /// Creates a new [AudioMetadata] instance.
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

  /// Creates an [AudioMetadata] instance from a map.
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

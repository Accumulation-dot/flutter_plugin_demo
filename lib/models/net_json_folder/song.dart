import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable(nullable: false)
class Song {
  final String all_rate;
  final String song_id;
  final String rank_change;
  final String biaoshi;
  final String author;
  final String album_id;
  final String pic_small;
  final String title;
  final String pic_big;
  final String album_title;
  Song(
      this.all_rate,
      this.song_id,
      this.rank_change,
      this.biaoshi,
      this.author,
      this.album_id,
      this.pic_small,
      this.title,
      this.pic_big,
      this.album_title);

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
  Map<String, dynamic> toJson() => _$SongToJson(this);
}

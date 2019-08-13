import 'package:flutter_plugin_demo/models/net_json_folder/song.dart';
import 'package:json_annotation/json_annotation.dart';

part 'song_rank.g.dart';

@JsonSerializable(nullable: false)
class SongRank {
  final String pic_s210;
  final String bg_pic;
  final String color;
  final String pic_s444;
  final int count;
  final int type;
  final List<Song> content;
  final String bg_color;
  final String web_url;
  final String name;
  final String comment;
  final String pic_s192;
  final String pic_s260;
  SongRank(
      this.pic_s210,
      this.bg_pic,
      this.color,
      this.pic_s444,
      this.count,
      this.type,
      this.content,
      this.bg_color,
      this.web_url,
      this.name,
      this.comment,
      this.pic_s192,
      this.pic_s260);
  factory SongRank.fromJson(Map<String, dynamic> json) =>
      _$SongRankFromJson(json);
  Map<String, dynamic> toJson() => _$SongRankToJson(this);
}

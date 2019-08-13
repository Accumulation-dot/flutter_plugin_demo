// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongRank _$SongRankFromJson(Map<String, dynamic> json) {
  return SongRank(
    json['pic_s210'] as String,
    json['bg_pic'] as String,
    json['color'] as String,
    json['pic_s444'] as String,
    json['count'] as int,
    json['type'] as int,
    (json['content'] as List)
        .map((e) => Song.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['bg_color'] as String,
    json['web_url'] as String,
    json['name'] as String,
    json['comment'] as String,
    json['pic_s192'] as String,
    json['pic_s260'] as String,
  );
}

Map<String, dynamic> _$SongRankToJson(SongRank instance) => <String, dynamic>{
      'pic_s210': instance.pic_s210,
      'bg_pic': instance.bg_pic,
      'color': instance.color,
      'pic_s444': instance.pic_s444,
      'count': instance.count,
      'type': instance.type,
      'content': instance.content,
      'bg_color': instance.bg_color,
      'web_url': instance.web_url,
      'name': instance.name,
      'comment': instance.comment,
      'pic_s192': instance.pic_s192,
      'pic_s260': instance.pic_s260,
    };

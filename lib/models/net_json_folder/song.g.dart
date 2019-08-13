// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
    json['all_rate'] as String,
    json['song_id'] as String,
    json['rank_change'] as String,
    json['biaoshi'] as String,
    json['author'] as String,
    json['album_id'] as String,
    json['pic_small'] as String,
    json['title'] as String,
    json['pic_big'] as String,
    json['album_title'] as String,
  );
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'all_rate': instance.all_rate,
      'song_id': instance.song_id,
      'rank_change': instance.rank_change,
      'biaoshi': instance.biaoshi,
      'author': instance.author,
      'album_id': instance.album_id,
      'pic_small': instance.pic_small,
      'title': instance.title,
      'pic_big': instance.pic_big,
      'album_title': instance.album_title,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetResult _$NetResultFromJson(Map<String, dynamic> json) {
  return NetResult(
    json['code'] as int,
    json['message'] as String,
  );
}

Map<String, dynamic> _$NetResultToJson(NetResult instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

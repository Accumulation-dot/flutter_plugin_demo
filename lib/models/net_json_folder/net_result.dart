
import 'package:json_annotation/json_annotation.dart';

part 'net_result.g.dart';

@JsonSerializable(nullable: false)
class NetResult {
  final int code;
  final String message;

  NetResult(this.code, this.message);
  factory NetResult.fromJson(Map<String, dynamic> json) =>
      _$NetResultFromJson(json);
  Map<String, dynamic> toJson() => _$NetResultToJson(this);


  bool isSuccess() {
    return this.code == 200;
  }


}
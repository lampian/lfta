import 'package:json_annotation/json_annotation.dart';

part 'origin_model.g.dart';

@JsonSerializable()
class OriginModel {
  final String name;
  final String url;

  const OriginModel({
    this.name = '',
    this.url = '',
  });

  factory OriginModel.fromJson(Map<String, dynamic> json) =>
      _$OriginModelFromJson(json);
  Map<String, dynamic> toJson() => _$OriginModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';
@JsonSerializable()

class StatusModel{
  StatusModel({
    required this.id,
    required this.title,
    required this.code,

  });
  final int? id;
  final String? title;
  final String? code;

  factory StatusModel.fromJson(Object? json) =>
      _$StatusModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
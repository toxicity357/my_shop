import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@JsonSerializable()
class FileModel {
  final String? url;
  final String? name;
  final String? originalName;
  final String? extension;
  final String? size;

  FileModel({
    required this.url,
    required this.name,
    required this.originalName,
    required this.extension,
    required this.size,
  });

  factory FileModel.fromJson(Object? json) =>
      _$FileModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}

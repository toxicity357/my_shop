// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) => FileModel(
      url: json['url'] as String?,
      name: json['name'] as String?,
      originalName: json['originalName'] as String?,
      extension: json['extension'] as String?,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'originalName': instance.originalName,
      'extension': instance.extension,
      'size': instance.size,
    };

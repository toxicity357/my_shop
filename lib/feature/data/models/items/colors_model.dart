import 'package:json_annotation/json_annotation.dart';

part 'colors_model.g.dart';

@JsonSerializable()
class ColorsModel{
final int? id;
final String? title;
final String? code;

  ColorsModel({
  required this.id,
  required this.title,
  required this.code
});

factory ColorsModel.fromJson(Object? json)=>
    _$ColorsModelFromJson (json as Map<String, dynamic>);

Map<String, dynamic>  toJson()=> _$ColorsModelToJson(this);
}
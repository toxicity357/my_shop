import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({required this.id, required this.accessKey});

  int? id;
  String? accessKey;

  factory UserModel.fromJson(Object? json) =>
      _$UserModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable()
class PaginationModel {
  PaginationModel(
      {required this.total, required this.page, required this.pages});

  final int page;
  final int pages;
  final int total;

  factory PaginationModel.fromJson(Object? json) =>
      _$PaginationModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}

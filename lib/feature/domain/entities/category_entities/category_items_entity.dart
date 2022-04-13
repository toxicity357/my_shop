import 'package:equatable/equatable.dart';

class CategoryItemsEnt extends Equatable {
  final int? id;
  final String? title;
  final String? slug;

  const CategoryItemsEnt(
      {required this.id, required this.title, required this.slug});

  @override
  List<Object?> get props => [id, title, slug];
}

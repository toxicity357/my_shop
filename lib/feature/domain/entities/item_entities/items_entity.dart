import 'package:equatable/equatable.dart';
import 'package:my_shop/feature/domain/entities/item_entities/colors_entity.dart';

import 'colors_entity.dart';
import 'image_entity.dart';

class ItemsEnt extends Equatable{
  const ItemsEnt({
    required this.id,
  required this.title,
  required this.slug,
  required this.image,
  required this.price,
  required this.colors,
});
  final int id;
  final String? title;
  final String? slug;
  final ImageEnt? image;
  final int? price;
  final List<ColorsEnt?> colors;

  @override
  List<Object?> get props => [id, title, slug, image, price, colors];
}
import 'package:equatable/equatable.dart';
import 'package:my_shop/feature/domain/entities/item_entities/file_entity.dart';

class ImageEnt extends Equatable{
  const ImageEnt({
    required this.file,
});
  final FileEnt? file;
  @override
  List<Object?> get props => [file];
}
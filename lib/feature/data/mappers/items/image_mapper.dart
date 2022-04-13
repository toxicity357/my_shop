import 'package:my_shop/feature/data/mappers/mapper.dart';
import 'package:my_shop/feature/data/models/items/image_model.dart';
import 'package:my_shop/feature/domain/entities/item_entities/image_entity.dart';

import 'file_mapper.dart';

class ImageMapper extends Mapper<ImageModel, ImageEnt> {
  ImageMapper({required this.fileMapper});
final FileMapper fileMapper;
  @override
  ImageEnt? map(ImageModel? entity) {
    return ImageEnt(
      file: fileMapper.map(entity?.file),
    );
  }
}
import 'package:my_shop/feature/data/mappers/mapper.dart';
import 'package:my_shop/feature/data/models/items/file_model.dart';
import 'package:my_shop/feature/domain/entities/item_entities/file_entity.dart';

class FileMapper extends Mapper<FileModel, FileEnt> {
  @override
  FileEnt? map(FileModel? entity) {
    return FileEnt(
      url: entity?.url ?? '',
      name: entity?.name ?? '',
      originalName: entity?.originalName ?? '',
      extension: entity?.extension ?? '',
      size: entity?.size ?? '',
    );
  }
}

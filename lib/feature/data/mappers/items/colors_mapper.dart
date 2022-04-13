import 'package:my_shop/feature/domain/entities/item_entities/colors_entity.dart';
import 'package:my_shop/feature/data/models/items/colors_model.dart';

import '../mapper.dart';

class ColorsMapper extends Mapper<ColorsModel, ColorsEnt> {
  @override
  ColorsEnt? map(ColorsModel? entity) {
    return ColorsEnt(
        id: entity?.id ?? 0,
        title: entity?.title ?? '',
        code: entity?.code ?? '',
    );
  }

}
import 'package:my_shop/feature/data/models/order/status_model.dart';
import 'package:my_shop/feature/domain/entities/order_entities/status_entity.dart';

import '../mapper.dart';

class StatusMapper extends Mapper<StatusModel, StatusEnt> {
  @override
  StatusEnt? map(StatusModel? entity) {
    return StatusEnt(
      id: entity?.id ?? 0,
      title: entity?.title ?? '',
      code: entity?.code ?? '',
    );
  }
}

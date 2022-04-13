import 'package:my_shop/feature/data/models/items/pagination_model.dart';
import 'package:my_shop/feature/domain/entities/pagination.dart';
import '../mapper.dart';

class PaginationMapper extends Mapper<PaginationModel, Pagination> {
  @override
  Pagination? map(PaginationModel? entity) {
    return Pagination(
      page: entity?.page ?? 1,
      pages: entity?.pages ?? 1,
      total: entity?.total ?? 1,
    );
  }
}

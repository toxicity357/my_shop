import 'package:my_shop/feature/data/models/user_login/user_model.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/user_entity.dart';

import '../mapper.dart';

class UsersMapper extends Mapper<UserModel, UserEnt> {
  @override
  UserEnt? map(UserModel? entity) {
    return UserEnt(
      id: entity?.id ?? 0,
      accessKey: entity?.accessKey ?? '',
    );
  }

}
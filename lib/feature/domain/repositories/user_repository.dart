import 'package:my_shop/feature/domain/entities/basket_entities/user_entity.dart';

abstract class UserRepository{
  Future<UserEnt?> getAccessKey();
}
import 'package:my_shop/feature/domain/entities/basket_entities/basket_entity.dart';

abstract class BasketRepository{
  Future<BasketEnt?> getBasket();

  Future<bool>? addToBasket({required int productId});

  Future<bool>? deleteFromBasket({required int productId});

  Future<bool>? changeQuantity({required int productId, required int quantity});
}
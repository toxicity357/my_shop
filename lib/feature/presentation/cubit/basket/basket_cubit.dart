import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_shop/feature/data/data_sources/constants.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/basket_entity.dart';
import 'package:my_shop/feature/domain/repositories/basket_repository.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object?> get props => [];
}

class BasketLoadingState extends BasketState {
  const BasketLoadingState();
}

class PuttingLoadingState extends BasketState {
  const PuttingLoadingState();
}

class StopPuttingLoadingState extends BasketState {
  const StopPuttingLoadingState();
}

class ChangeQuantityLoadingState extends BasketState {
  const ChangeQuantityLoadingState();
}

class StopChangeQuantityLoadingState extends BasketState {
  const StopChangeQuantityLoadingState();
}

class BasketEmpty extends BasketState {
  const BasketEmpty();
}

class BasketItemsState extends BasketState {
  const BasketItemsState({required this.productId});

  final int? productId;

  @override
  List<Object?> get props => [productId];
}

class InitialLoadBasket extends BasketState {}

class BasketLoadSuccess extends BasketState {
  const BasketLoadSuccess({required this.loadedBasket});

  final BasketEnt? loadedBasket;

  @override
  List<Object?> get props => [loadedBasket];
}

class BasketErrorState extends BasketState {
  const BasketErrorState();
}

class BasketCubit extends Cubit<BasketState> {
  BasketCubit(this.basketRepository) : super(const BasketLoadingState()) {
    init();
  }

  final BasketRepository basketRepository;
  Set<int> initialLoadedProductsId = {};

  Future<void> init() async {
    initialLoadedProductsId = Set.from(respBasketProducts);
  }

  Future<void> basket() async {
    emit(const BasketLoadingState());
    try {
      final result = await basketRepository.getBasket();
      if (result!.items.isNotEmpty) {
        emit(BasketLoadSuccess(loadedBasket: result));
      } else {
        emit(const BasketEmpty());
      }
    } catch (e) {
      emit(const BasketErrorState());
    }
  }

  Future<BasketEnt?> fetchBasket() async {
    emit(const BasketLoadingState());
    try {
      final item = await basketRepository.getBasket();
      if (item!.items.isNotEmpty) {
        emit(BasketLoadSuccess(loadedBasket: item));
        respBasketProducts.addAll(item.items.map((e) => e?.item?.id));
      } else {
        emit(const BasketEmpty());
      }
    } catch (e) {
      emit(const BasketErrorState());
    }
  }

  Future<void> addOrDeleteProduct(
      {required int productId, required bool value}) async {
    emit(const PuttingLoadingState());
    try {
      if (!value) {
        basketRepository.addToBasket(productId: productId);
        initialLoadedProductsId.add(productId);
        respBasketProducts.add(productId);
      } else {
        basketRepository.deleteFromBasket(productId: productId);
        initialLoadedProductsId.remove(productId);
        respBasketProducts.remove(productId);
      }
      await fetchBasket();
    } catch (e) {
      emit(const BasketErrorState());
    }
    emit(const StopPuttingLoadingState());
    emit(BasketItemsState(productId: productId));
  }

  Future<void> changeQuantity(
      {required int productId, required int quantity}) async {
    emit(const ChangeQuantityLoadingState());
    await basketRepository.changeQuantity(
        productId: productId, quantity: quantity);
    await fetchBasket();
    emit(const StopChangeQuantityLoadingState());
  }

  Future<void> deleteFromBasket({required int productId}) async {
    emit(const ChangeQuantityLoadingState());
    await basketRepository.deleteFromBasket(productId: productId);
    await basket();
    respBasketProducts.remove(productId);
    emit(const StopChangeQuantityLoadingState());
  }
}

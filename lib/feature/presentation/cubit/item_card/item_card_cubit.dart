import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/domain/entities/item_entities/items_entity.dart';
import 'package:my_shop/feature/domain/repositories/item_card_repository.dart';

class ItemCardState extends Equatable {
  const ItemCardState();

  @override
  List<Object?> get props => [];
}

class LoadingCardState extends ItemCardState {
  const LoadingCardState();
}


class ItemCardLoadSuccess extends ItemCardState {
  const ItemCardLoadSuccess({required this.loadedItemCard});

  final ItemsEnt? loadedItemCard;

  @override
  List<Object?> get props => [loadedItemCard];
}

class ErrorState extends ItemCardState {
  const ErrorState();
}

class ItemCardCubit extends Cubit<ItemCardState> {
  ItemCardCubit(this._itemCardRepository) : super(const LoadingCardState());
  final ItemCardRepository _itemCardRepository;

  Future<void> fetchItemCard({required id}) async {
    emit(const LoadingCardState());
    try {
      final result = await _itemCardRepository.getProduct(id: id);
      emit(ItemCardLoadSuccess(loadedItemCard: result));
    } catch (e) {
      emit(const ErrorState());
    }
  }
}

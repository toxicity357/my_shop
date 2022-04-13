import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_shop/feature/domain/entities/category_entities/category_list_items_entity.dart';
import 'package:my_shop/feature/domain/entities/item_entities/list_items_entity.dart';
import 'package:my_shop/feature/domain/repositories/items_repository.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends CatalogState {
  const LoadingState();
}

class RefreshCatalog extends CatalogState {}

class InitialLoadCatalog extends CatalogState {}

class InitialLoadCategory extends CatalogState {}

class CatalogLoadSuccess extends CatalogState {
  const CatalogLoadSuccess({required this.loadedCatalog});

  final ListItemsEnt? loadedCatalog;


  @override
  List<Object?> get props => [loadedCatalog];
}
class CategoryLoadSuccess extends CatalogState {
  const CategoryLoadSuccess({required this.loadedCategory});

  final CategoryListItemsEnt? loadedCategory;


  @override
  List<Object?> get props => [loadedCategory];
}

class ErrorState extends CatalogState {
  const ErrorState();
}
class SortItemsState extends CatalogState{
  const SortItemsState();
}

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit(this._catalogRepository) : super(const LoadingState());
  final ItemsRepository _catalogRepository;
  String categoryId = '';


  Future<void> fetchCatalog({required offset, required categoryId}) async {
    emit(InitialLoadCatalog());
    try {
      final catalogResult = await _catalogRepository.getCatalog(offset: offset, categoryId: categoryId);
      emit(CatalogLoadSuccess(loadedCatalog: catalogResult));
    } catch (e) {
      emit(const ErrorState());
    }
  }
  Future<void> fetchCategory() async{
    emit(InitialLoadCategory());
    try{
      final categoryResult = await _catalogRepository.getCategory();
      emit(CategoryLoadSuccess(loadedCategory: categoryResult));
    } catch(e){
      emit(const ErrorState());
    }
  }
}

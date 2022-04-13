import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/error/error_with_scaffold.dart';
import 'package:my_shop/feature/domain/repositories/item_card_repository.dart';
import 'package:my_shop/feature/presentation/cubit/basket/basket_cubit.dart';
import 'package:my_shop/feature/presentation/cubit/item_card/item_card_cubit.dart';
import 'package:my_shop/feature/ui/item/add_to_basket_button_widget.dart';
import 'package:my_shop/feature/ui/item/Item_card_widget.dart';

class ItemCardPage extends StatelessWidget {
  const ItemCardPage({required this.id, Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ItemCardCubit(context.read<ItemCardRepository>()),
        ),
        BlocProvider(
          create: (context) => BasketCubit(context.read()),
        ),
      ],
      child: _ItemCardWidget(id: id),
    );
  }
}

class _ItemCardWidget extends StatefulWidget {
  const _ItemCardWidget({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<_ItemCardWidget> createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<_ItemCardWidget> {
  @override
  void initState() {
    context.read<ItemCardCubit>().fetchItemCard(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCardCubit, ItemCardState>(
      builder: (context, state) {
        if (state is ItemCardLoadSuccess) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                alignment: Alignment.centerLeft,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('${state.loadedItemCard?.title}',
                  overflow: TextOverflow.ellipsis),
              backgroundColor: Colors.green,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ItemCardWidget(
                    title: state.loadedItemCard?.title,
                    url: state.loadedItemCard?.image?.file?.url,
                    price: state.loadedItemCard?.price,
                    colors: state.loadedItemCard?.colors,
                    id: state.loadedItemCard?.id,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AddToBasketButton(productId: state.loadedItemCard?.id),
                ),
              ],
            ),
          );
        }
        if (state is ErrorState) {
          return ErrorPageScaffolded(
              refresh: () =>
                  context.read<ItemCardCubit>().fetchItemCard(id: widget.id), pageTitle: 'Item Card');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

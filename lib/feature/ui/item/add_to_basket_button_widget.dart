import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/presentation/cubit/basket/basket_cubit.dart';

class AddToBasketButton extends StatefulWidget {
  const AddToBasketButton({Key? key, required this.productId})
      : super(key: key);
  final int? productId;

  @override
  State<AddToBasketButton> createState() => _AddToBasketButtonState();
}

class _AddToBasketButtonState extends State<AddToBasketButton>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<BasketCubit, BasketState>(
      listenWhen: (_, c) => c is BasketItemsState || c is BasketEmpty,
      listener: (context, state) {
        if (state is BasketItemsState) {
          if (state.productId == widget.productId) {
            setState(() {});
          } else {
            setState(() {});
          }
        }
      },
      child: BlocBuilder<BasketCubit, BasketState>(
          buildWhen: (_, c) =>
              c is PuttingLoadingState || c is StopPuttingLoadingState,
          builder: (context, state) {
            return Center(
              child: CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  color: context
                          .read<BasketCubit>()
                          .initialLoadedProductsId
                          .contains(widget.productId)
                      ? Colors.red
                      : Colors.lightGreen,
                  onPressed: () {
                    context.read<BasketCubit>().addOrDeleteProduct(
                        productId: widget.productId!,
                        value: context
                            .read<BasketCubit>()
                            .initialLoadedProductsId
                            .contains(widget.productId));
                  },
                  child: Icon(
                    context
                            .read<BasketCubit>()
                            .initialLoadedProductsId
                            .contains(widget.productId)
                        ? Icons.delete_forever
                        : Icons.add_shopping_cart_outlined,
                    size: 30,
                  )),
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

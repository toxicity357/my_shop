import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/feature/presentation/cubit/basket/basket_cubit.dart';
import 'package:provider/src/provider.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({Key? key, required this.quantity, required this.productId})
      : super(key: key);
  final int? quantity;
  final int? productId;

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Quantity: ${widget.quantity}'),
          SizedBox(
            height: 40,
            width: 40,
            child: CupertinoButton(
              onPressed: () {
                if (widget.quantity! > 1) {
                  context.read<BasketCubit>().changeQuantity(
                      productId: widget.productId!, quantity: widget.quantity! - 1);
                }
              },
              child: const Icon(Icons.remove_circle, color: Colors.green,),
            ),
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: CupertinoButton(
              onPressed: () async {
                  context.read<BasketCubit>().changeQuantity(
                      productId: widget.productId!, quantity: widget.quantity! + 1);
              },
              child: const Icon(Icons.add_circle, color: Colors.green,),
            ),
          ),
        ],
      );

  }
}

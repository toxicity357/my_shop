import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/feature/presentation/cubit/basket/basket_cubit.dart';
import 'package:provider/src/provider.dart';

class ItemDeleteButton extends StatefulWidget {
  const ItemDeleteButton({Key? key, required this.productId}) : super(key: key);
  final int? productId;

  @override
  State<ItemDeleteButton> createState() => _ItemDeleteButtonState();
}

class _ItemDeleteButtonState extends State<ItemDeleteButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
        children:[
          Text('Remove product:'),
          SizedBox(
            height: 40,
            width: 40,
            child: CupertinoButton(
                child: Icon(Icons.delete, color: Colors.green,),
                onPressed: (){
                  context.read<BasketCubit>().deleteFromBasket(
                    productId: widget.productId!
                  );
                }),
          )
        ],
      );
  }
}

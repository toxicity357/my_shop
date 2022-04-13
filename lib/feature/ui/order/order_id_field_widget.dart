import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/feature/presentation/cubit/order/order_info_cubit.dart';
import 'package:provider/src/provider.dart';

class OrderIdField extends StatefulWidget {
  const OrderIdField({Key? key}) : super(key: key);

  @override
  State<OrderIdField> createState() => _OrderIdFieldState();
}

class _OrderIdFieldState extends State<OrderIdField> {
  final orderId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: orderId,
              cursorColor: Colors.lightGreen,
              decoration: const InputDecoration(
                enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen)),
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
                labelText: 'Order ID',
                helperText: 'Enter your Order ID',
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: CupertinoButton(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                padding: EdgeInsets.zero,
                color: Colors.lightGreen,
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                   context.read<OrderInfoCubit>().fetchOrderInfo(orderId:orderId.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

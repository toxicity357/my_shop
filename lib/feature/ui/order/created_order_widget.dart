import 'package:flutter/material.dart';

class CreatedOrderWidget extends StatelessWidget {
  const CreatedOrderWidget({
    Key? key,
    required this.orderId,
    required this.status,
    required this.totalPrice,
  }) : super(key: key);
  final int orderId;
  final String status;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              showCursor: false,
              readOnly: true,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen),
                  ),
                  labelText: 'Order ID',
                  hintText: '$orderId',
                  hintStyle: const TextStyle(color: Colors.black),
                  labelStyle: const TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextField(
              showCursor: false,
              readOnly: true,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen),
                  ),
                  labelText: 'Total price',
                  hintText: '$totalPrice ₽',
                  hintStyle: const TextStyle(color: Colors.black),
                  labelStyle: const TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextField(
              showCursor: false,
              readOnly: true,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen),
                  ),
                  labelText: 'Status',
                  hintText: status,
                  hintStyle: const TextStyle(color: Colors.black),
                  labelStyle: const TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ],
        ),
      ),
    );
  }
}

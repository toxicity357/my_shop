import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:my_shop/feature/presentation/cubit/order/create_order_cubit.dart';
import 'package:provider/src/provider.dart';

class ClientInfo extends StatefulWidget {
  const ClientInfo({Key? key}) : super(key: key);

  @override
  State<ClientInfo> createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {
  final name = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  final comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name,
              cursorColor: Colors.lightGreen,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
                labelText: 'Name',
                helperText: 'Enter your name',
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.text,
            ),
            const Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
            TextField(
              controller: email,
              cursorColor: Colors.lightGreen,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
                labelText: 'Email',
                helperText: 'Enter your email',
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextField(
              controller: phone,
              cursorColor: Colors.lightGreen,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
                labelText: 'Phone',
                helperText: 'Enter your phone',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 6),
                  child: SizedBox(
                    width: 40,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Text(
                            '+7',
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          height: 28,
                          width: 1,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                TextInputMask(mask: ['9999999999'], reverse: false)
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextField(
              controller: address,
              cursorColor: Colors.lightGreen,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
                labelText: 'Address',
                helperText: 'Enter your address',
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.text,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextField(
              controller: comment,
              cursorColor: Colors.lightGreen,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
                labelText: 'Comment',
                helperText: 'Enter your comment',
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.text,
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
                  context.read<OrderCubit>().fetchOrder(
                      name: name.text,
                      address: address.text,
                      phone: '+7${phone.text}',
                      email: email.text,
                      comment: comment.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UserLoginWidget extends StatelessWidget {
  const UserLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            _UserNameInput(),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            _PasswordInput(),
          ],
        ),
      ),
    );
  }
}

class _UserNameInput extends StatelessWidget {
  const _UserNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorColor: Colors.lightGreen,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen),
        ),
        labelText: 'UserName',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: true,
      cursorColor: Colors.lightGreen,
      decoration: InputDecoration(
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen),
        ),
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, required this.refresh}) : super(key: key);
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.only(top: 300)),
        const Center(child: Text('⛔', style: TextStyle(fontSize: 64))),
        Center(
          child: Text(
            '❌Something went wrong❌',
            style: theme.textTheme.headline5,
          ),
        ),
        CupertinoButton(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          padding: EdgeInsets.zero,
          color: Colors.green,
          child: const Text(
            'Refresh',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: refresh,
        ),
      ],
    );
  }
}

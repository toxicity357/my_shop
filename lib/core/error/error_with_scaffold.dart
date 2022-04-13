import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPageScaffolded extends StatelessWidget {
  const ErrorPageScaffolded({Key? key, required this.refresh,required this.pageTitle}) : super(key: key);
  final VoidCallback refresh;
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:  Text(pageTitle),
        leading: IconButton(
          alignment: Alignment.centerLeft,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(top: 300)),
          const Center(child: Text('⛔', style: TextStyle(fontSize: 64))),
          Center(
            child: Text(
              '❌Something went wrong!❌',
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
      ),
    );
  }
}

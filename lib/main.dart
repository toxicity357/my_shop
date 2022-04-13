import 'package:flutter/material.dart';

import 'development.dart';
import 'feature/presentation/cubit/user_login/user_login_page.dart';

Future<void> main() async => Development().init();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: UserLoginPage());

  }
}

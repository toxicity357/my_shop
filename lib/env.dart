import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:my_shop/injection.dart';

import 'main.dart';

class Env {
Future init() async{
  WidgetsFlutterBinding.ensureInitialized();
  final injectionContainer = await injection(const App());
  runApp(injectionContainer);
  }
}

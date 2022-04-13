import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseStore {
  const BaseStore(this.sharedPreferences);

  final SharedPreferences sharedPreferences;
}
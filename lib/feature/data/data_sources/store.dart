import 'package:my_shop/feature/data/data_sources/base_store.dart';
import 'package:my_shop/feature/data/data_sources/user_access_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store extends BaseStore with UserAccessKey{
const Store(SharedPreferences sharedPreferences): super(sharedPreferences);
}
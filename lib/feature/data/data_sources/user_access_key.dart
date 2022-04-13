import 'package:my_shop/feature/data/data_sources/base_store.dart';

mixin UserAccessKey on BaseStore{
  static const accessKey = 'accessKey';

  String? getAccessKey(){
    return sharedPreferences.getString(accessKey);
  }
  Future<void> setAccessKey(String? value){
    return sharedPreferences.setString(accessKey, '$value');
  }
}

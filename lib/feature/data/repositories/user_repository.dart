import 'dart:convert';
import 'package:my_shop/feature/data/data_sources/store.dart';
import 'package:my_shop/feature/data/mappers/user_login/user_mapper.dart';
import 'package:my_shop/feature/data/models/user_login/user_model.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/user_entity.dart';
import 'package:my_shop/feature/domain/repositories/user_repository.dart';
import 'package:http/http.dart' as http;


class UserRequestFailure implements Exception{}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._usersMapper, this._store);

  final Store _store;
  final UsersMapper _usersMapper;
  static const _baseUrl = 'vue-study.skillbox.cc';

  @override
  Future<UserEnt?> getAccessKey() async {
    final userRequest = Uri.https(_baseUrl, '/api/users/accessKey');
    final userResponse = await http.get(userRequest);
    final _response = UserModel.fromJson(json.decode(userResponse.body));
    if(userResponse.statusCode != 200){
      throw UserRequestFailure;
    }
    final user = _usersMapper.map(_response);
    await _store.setAccessKey(user?.accessKey);
    return user;

  }
}

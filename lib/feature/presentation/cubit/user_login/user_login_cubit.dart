import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:my_shop/feature/domain/entities/basket_entities/user_entity.dart';
import 'package:my_shop/feature/domain/repositories/user_repository.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends UserLoginState {
  const LoadingState();
}

class InitialUserLoadLogin extends UserLoginState {}

class UserLoginLoadSuccess extends UserLoginState {
  const UserLoginLoadSuccess({required this.loadedUserLogin});

  final UserEnt? loadedUserLogin;

  @override
  List<Object?> get props => [loadedUserLogin];
}
class ErrorState extends UserLoginState{
  const ErrorState();
}

class UserLoginCubit extends Cubit<UserLoginState>{
  UserLoginCubit(this._userRepository): super(const LoadingState());
  final UserRepository _userRepository;

  Future<UserEnt?> fetchLogin() async{
    emit(InitialUserLoadLogin());
    try{
      final result = await _userRepository.getAccessKey();
      emit(UserLoginLoadSuccess(loadedUserLogin: result));
    } catch (e){
      emit(const ErrorState());
    }
  }
}

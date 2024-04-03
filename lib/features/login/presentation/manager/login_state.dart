import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/login/domain/entities/login_entity.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginEntity loginEntity;

  LoginSuccessState(this.loginEntity);
}

class LoginErrorState extends LoginState {
  Failures failures;

  LoginErrorState(this.failures);
}
class LoginUpdateState extends LoginState {}


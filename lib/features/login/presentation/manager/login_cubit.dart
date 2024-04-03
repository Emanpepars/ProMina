import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_mina/features/login/data/data_sources/login_data_sources.dart';
import 'package:pro_mina/features/login/data/repositories/login_data_repo.dart';
import 'package:pro_mina/features/login/domain/entities/user_data.dart';
import 'package:pro_mina/features/login/domain/use_cases/login_use_case.dart';
import '../../domain/repositories/login_domain_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginDataSources dto;
  late LoginDomainRepo loginDomainRepo;

  LoginCubit({required this.dto}) : super(LoginInitState()) {
    loginDomainRepo = LoginDataRepo(dto);
  }

  static LoginCubit get(context) => BlocProvider.of(context);

  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  login() async {
    emit(LoginLoadingState());
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);

    var response = await loginUseCase.call(
      UserData(
        email: emailEditingController.text,
        password: passwordEditingController.text,
      ),
    );
    response.fold((l) => emit(LoginErrorState(l)), (r) {
      emit(LoginSuccessState(r));
    });
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  onSubmitButton(context) {
    if (loginFormKey.currentState!.validate()) {
      login();
    } else {
      autoValidateMode = AutovalidateMode.always;
      emit(LoginUpdateState());
    }
  }
}

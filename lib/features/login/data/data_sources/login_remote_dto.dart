import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/api_consumer.dart';
import 'package:pro_mina/core/api/api_keys.dart';
import 'package:pro_mina/core/api/end_points.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/core/api/error/server_failures.dart';
import 'package:pro_mina/features/login/data/data_sources/login_data_sources.dart';
import 'package:pro_mina/features/login/data/models/login_model.dart';

import '../../domain/entities/user_data.dart';

class LoginRemoteDto extends LoginDataSources {
  ApiConsumer api;

  LoginRemoteDto({required this.api});

  @override
  Future<Either<Failures, LoginModel>> login(UserData userData) async {
    try {
      var response = await api.post(EndPoints.login, data: {
        ApiKeys.email: userData.email,
        ApiKeys.password: userData.password,
      });
      LoginModel loginModel = LoginModel.fromJson(response);
      return Right(loginModel);
    } catch (e) {
      return left(ServerFailures(e.toString()));
    }
  }
}

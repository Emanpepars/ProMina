import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/login/data/models/login_model.dart';

import '../../domain/entities/user_data.dart';

abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(UserData userData);
}

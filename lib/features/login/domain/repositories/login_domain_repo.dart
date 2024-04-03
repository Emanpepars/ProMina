import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/login/domain/entities/login_entity.dart';

import '../entities/user_data.dart';

abstract class LoginDomainRepo {
  Future<Either<Failures, LoginEntity>> login(UserData userData);
}

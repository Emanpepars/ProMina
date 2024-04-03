import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/login/data/data_sources/login_data_sources.dart';
import 'package:pro_mina/features/login/domain/entities/login_entity.dart';
import 'package:pro_mina/features/login/domain/repositories/login_domain_repo.dart';

import '../../domain/entities/user_data.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSources loginDataSources;

  LoginDataRepo(this.loginDataSources);

  @override
  Future<Either<Failures, LoginEntity>> login(UserData userData) =>
      loginDataSources.login(userData);
}

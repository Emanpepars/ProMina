import 'package:dartz/dartz.dart';
import 'package:pro_mina/core/api/error/failures.dart';
import 'package:pro_mina/features/login/domain/entities/login_entity.dart';
import 'package:pro_mina/features/login/domain/entities/user_data.dart';
import 'package:pro_mina/features/login/domain/repositories/login_domain_repo.dart';

class LoginUseCase {
  LoginDomainRepo loginDomainRepo;

  LoginUseCase(this.loginDomainRepo);

  Future<Either<Failures, LoginEntity>> call(UserData userData) => loginDomainRepo.login(userData);
}

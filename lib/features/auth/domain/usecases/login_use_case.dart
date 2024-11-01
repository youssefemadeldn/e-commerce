import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/entity/login_entity.dart';
import 'package:e_commerce/features/auth/domain/repository/base_auth_repo.dart';
import 'package:injectable/injectable.dart';

// hire level module don't depend on low level model
// dependency inversion
@injectable
class LoginUseCase {
// hire level module don't depend on low level model
// dependency inversion \/ \/ 
  BaseAuthRepo baseAuthRepo;

  LoginUseCase({required this.baseAuthRepo});

  Future<Either<Failure, LoginEntity>> invoke(
    String email,
    String password,
  ) async {
    return await baseAuthRepo.login(
      email: email,
      password: password,
    );
  }
}

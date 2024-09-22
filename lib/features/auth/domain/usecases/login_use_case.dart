import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/entity/login_entity.dart';
import 'package:e_commerce/features/auth/domain/repository/base_auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
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

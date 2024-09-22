import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/entity/register_entity.dart';
import 'package:e_commerce/features/auth/domain/repository/base_auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  BaseAuthRepo baseAuthRepo;

  RegisterUseCase({required this.baseAuthRepo});
// execute or call
  Future<Either<Failure, RegisterEntity>> invoke(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    return await baseAuthRepo.register(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}

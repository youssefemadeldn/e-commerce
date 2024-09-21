import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/entity/register_entity.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, RegisterEntity>> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });
}

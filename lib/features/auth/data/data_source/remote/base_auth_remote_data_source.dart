import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/entity/register_entity.dart';

abstract class BaseAuthRemoteDataSource {
  Future<Either<Failure, RegisterEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}

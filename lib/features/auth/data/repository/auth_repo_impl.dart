import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/base_auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/domain/entity/register_entity.dart';
import 'package:e_commerce/features/auth/domain/repository/base_auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseAuthRepo)
class AuthRepoImpl implements BaseAuthRepo {
  BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepoImpl({required this.baseAuthRemoteDataSource});
  @override
  Future<Either<Failure, RegisterEntity>> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    var either = await baseAuthRemoteDataSource.register(
        name, email, password, rePassword, phone);

    return either.fold((error) => left(error), (response) => right(response));
  }
}

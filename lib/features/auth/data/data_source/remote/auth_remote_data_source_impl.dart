import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/api%20manager/api_manager.dart';
import 'package:e_commerce/core/api/api_constant.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/base_auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/data/models/login_model.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:e_commerce/features/auth/domain/entity/register_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements BaseAuthRemoteDataSource {
  ApiManager apiManager = ApiManager();
  @override
  Future<Either<Failure, RegisterEntity>> register(String name, String email,
      String password, String rePassword, String phone) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await Dio().post(
        ApiConstant.baseUrl + ApiConstant.registerEP,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
        },
        options: Options(
          headers: {},
          validateStatus: (status) => true,
        ),
      );

      RegisterModel registerModel = RegisterModel.fromJson(response.data);

      //  Mapping

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        // Success Case
        return Right(registerModel);
      } else {
        // Server Error Case
        return Left(ServerFailure(errorMessage: registerModel.message!));
      }
    } else {
      // No internet Case

      return Left(NetworkFailure(errorMessage: "Check Internet"));
    }
  }

  @override
  Future<Either<Failure, LoginModel>> login(
      String email, String password) async {
    var connectionResults = await Connectivity().checkConnectivity();
    if (connectionResults.contains(ConnectivityResult.wifi) ||
        connectionResults.contains(ConnectivityResult.mobile)) {
      // Internet Connection Case
      var response = await Dio().post(
        ApiConstant.baseUrl + ApiConstant.loginEP,
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {},
          validateStatus: (status) => true,
        ),
      );
      var loginModel = LoginModel.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        // Success Case
        SharedPrefUtils.saveData(key: 'token', data: loginModel.token);
        return Right(loginModel);
      } else {
        // Server Error Case
        return left(ServerFailure(errorMessage: loginModel.message!));
      }
    } else {
      // No InterNet Case
      return Left(NetworkFailure(errorMessage: "Check InterNet"));
    }
  }
}

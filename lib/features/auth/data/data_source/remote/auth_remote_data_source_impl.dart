import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/api%20manager/api_manager.dart';
import 'package:e_commerce/core/api/api_constant.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/base_auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';

class AuthRemoteDataSourceImpl implements BaseAuthRemoteDataSource {
  ApiManager apiManager = ApiManager();
  @override
  Future<Either<Failure, RegisterModel>> register(String name, String email,
      String password, String rePassword, String phone) async {
    var checkInternet = await Connectivity().checkConnectivity();

    if (checkInternet == ConnectivityResult.wifi ||
        checkInternet == ConnectivityResult.mobile) {
      var response = await Dio().post(
        ApiConstant.baseUrl + ApiConstant.registerEP,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
        },
      );

      var registerModel = RegisterModel.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(registerModel);
      } else {
        return Left(ServerFailure(errorMessage: registerModel.message!));
      }
    } else {
      // no internet

      return Left(NetworkFailure(errorMessage: "Check InterNet"));
    }
  }
}

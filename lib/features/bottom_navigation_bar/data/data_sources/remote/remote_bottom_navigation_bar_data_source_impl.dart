import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_constant.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/data/data_sources/remote/base_remote_bottom_navigation_bar_data_source.dart';
import 'package:e_commerce/features/bottom_navigation_bar/data/models/add_to_cart_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseRemoteBottomNavigationBarDataSource)
class RemoteBottomNavigationBarDataSourceImpl
    implements BaseRemoteBottomNavigationBarDataSource {
  @override
  Future<Either<Failure, AddToCartModel>> addToCart(String productId) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        // Internet Connection Case

        var token = SharedPrefUtils.getData('token');

        var response = await Dio().post(
          ApiConstant.baseUrl + ApiConstant.addProductToCartEP,
          data: {
            'productId': productId,
          },
          options: Options(
            headers: {
              'token': token.toString(),
            },
            validateStatus: (status) => true,
          ),
        );

        var addToCartModel = AddToCartModel.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          // Server Success Case
          // 200 Ok
          return Right(addToCartModel);
        } else {
          // Server Error Case
          // 500

          return Left(ServerFailure(
              errorMessage: 'ServerFailure: ${addToCartModel.message}'));
        }
      } else {
        // No Internet Case
        return Left(NetworkFailure(errorMessage: 'Check Internet'));
      }
    } catch (e) {
      // Failure
      return Left(Failure(errorMessage: 'Failure ${e.toString()}'));
    }
  }
}

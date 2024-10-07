import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_constant.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/cart/data/data_source/remote/base_remote_cart_data_source.dart';
import 'package:e_commerce/features/cart/data/models/get_items_in_cart_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseRemoteCartDataSource)
class RemoteCartDataSourceImpl implements BaseRemoteCartDataSource {
  @override
  Future<Either<Failure, GetItemsInCartModel>> getItemsInCart() async {
    try {
      var connectivityResults = await Connectivity().checkConnectivity();

      if (connectivityResults.contains(ConnectivityResult.wifi) ||
          connectivityResults.contains(ConnectivityResult.bluetooth)) {
        // Internet Connection Case
        var token = SharedPrefUtils.getData('token');

        var response = await Dio().get(
          ApiConstant.baseUrl + ApiConstant.getItemsInCartEP,
          data: {},
          options: Options(
            headers: {
              'token': token,
            },
            validateStatus: (status) => true,
          ),
        );

        GetItemsInCartModel getItemsInCartModel =
            GetItemsInCartModel.fromJson(response.data);

        if (response.statusCode! >= 200 || response.statusCode! < 300) {
          // Success Response Case
          // 200 Ok
          return right(getItemsInCartModel);
        } else {
          // Error Response Case
          // 400 Bad Request

          return left(ServerFailure(
              errorMessage: 'ServerFailure: ${getItemsInCartModel.message}'));
        }
      } else {
        // No Internet Connection Case

        return left(NetworkFailure(errorMessage: 'Check Internet'));
      }
    } catch (e) {
      return left(Failure(errorMessage: 'Failure: ${e.toString()}'));
    }
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_constant.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/categories_tab/data/data_source/remote/base_remote_category_tab_data_source.dart';
import 'package:e_commerce/features/categories_tab/data/models/products_model.dart';

class RemoteCategoryTabDataSourceImpl
    implements BaseRemoteCategoryTabDataSource {
  @override
  Future<Either<Failure, ProductsModel>> getAllProducts() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        // connected internet case
        var response = await Dio().get(
          ApiConstant.baseUrl + ApiConstant.getAllProductsEP,
          data: {},
          options: Options(
            validateStatus: (status) => true,
          ),
        );

        ProductsModel productsModel = ProductsModel.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          // Success response Case
          return Right(productsModel);
        } else {
          // Error Response Case

          return Left(ServerFailure(errorMessage: productsModel.message!));
        }
      } else {
        // no Internet connection Case

        return Left(NetworkFailure(errorMessage: "check Internet"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: 'Failure ${e.toString()}'));
    }
  }
}

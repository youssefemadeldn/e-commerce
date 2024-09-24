import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_constant.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/data/data_source/remote/base_remote_home_tab_data_source.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseRemoteHomeTabDataSource)
class RemoteHomeTabDataSourceImpl implements BaseRemoteHomeTabDataSource {
  @override
  Future<Either<Failure, CategoryModel>> getAllCategories() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //  Internet Connection Case
        var response = await Dio().get(
            ApiConstant.baseUrl + ApiConstant.getAllCategoriesEP,
            queryParameters: {});

        CategoryModel categoryModel = CategoryModel.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          // Server success case 200 OK
          return Right(categoryModel);
        } else {
          // Server Error Case 500
          return Left(ServerFailure(errorMessage: categoryModel.message!));
        }
      } else {
        return Left(NetworkFailure(errorMessage: 'Check InterNet'));
      }
    } catch (e) {
      return Left(Failure(errorMessage: "Failure: ${e.toString()}"));
    }
  }
}

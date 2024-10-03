import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/categories_tab/data/data_source/remote/base_remote_category_tab_data_source.dart';
import 'package:e_commerce/features/bottom_navigation_bar/categories_tab/domain/entity/products_enity.dart';
import 'package:e_commerce/features/bottom_navigation_bar/categories_tab/domain/repo/base_category_tab_repo.dart';

class CategoryTabRepoImpl implements BaseCategoryTabRepo {
  BaseRemoteCategoryTabDataSource baseRemoteCategoryTabDataSource;
  CategoryTabRepoImpl({required this.baseRemoteCategoryTabDataSource});
  @override
  Future<Either<Failure, ProductsEntity>> getAllProducts() async {
    var either = await baseRemoteCategoryTabDataSource.getAllProducts();

    return either.fold(
        (failure) => Left(failure), (productModel) => Right(productModel));
  }
}

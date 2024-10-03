import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/categories_tab/domain/entity/products_enity.dart';

abstract class BaseRemoteCategoryTabDataSource {
  Future<Either<Failure, ProductsEntity>> getAllProducts();
}

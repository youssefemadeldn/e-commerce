import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/categories_tab/domain/entity/products_enity.dart';

abstract class BaseCategoryTabRepo {
  Future<Either<Failure, ProductsEntity>> getAllProducts();
}

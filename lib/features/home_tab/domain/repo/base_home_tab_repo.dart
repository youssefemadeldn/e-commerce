import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home_tab/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home_tab/domain/entity/category_entity.dart';

abstract class BaseHomeTabRepo {
  Future<Either<Failure, CategoryEntity>> getAllCategories();
  Future<Either<Failure, BrandsEntity>> getAllBrands();
}

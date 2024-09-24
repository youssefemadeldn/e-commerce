import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/domain/entity/category_entity.dart';

abstract class BaseHomeTabRepo {
  Future<Either<Failure, CategoryEntity>> getAllCategories();
//  Future<Either<Failure, CategoryEntity>>  getAllCategories();
}

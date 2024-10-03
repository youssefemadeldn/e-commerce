import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/categories_tab/domain/entity/products_enity.dart';
import 'package:e_commerce/features/bottom_navigation_bar/categories_tab/domain/repo/base_category_tab_repo.dart';

class GetAllProductsUseCase {
  BaseCategoryTabRepo baseCategoryTabRepo;

  GetAllProductsUseCase({required this.baseCategoryTabRepo});

  Future<Either<Failure, ProductsEntity>> invoke() async {
    return baseCategoryTabRepo.getAllProducts();
  }
}

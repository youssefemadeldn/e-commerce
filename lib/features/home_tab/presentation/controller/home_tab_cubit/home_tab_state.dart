import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home_tab/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/home_tab/domain/entity/category_entity.dart';

abstract class HomeTabState {}

class HomeTabInitialState extends HomeTabState {}

class HomeCategoriesLoadingState extends HomeTabState {}

class HomeCategoriesErrorState extends HomeTabState {
  Failure failure;
  HomeCategoriesErrorState({required this.failure});
}

class HomeCategoriesSuccessState extends HomeTabState {
  CategoryEntity categoryEntity;

  HomeCategoriesSuccessState({required this.categoryEntity});
}

////////////////////////////////////////////////////////

class HomeBrandsLoadingState extends HomeTabState {}

class HomeBrandsErrorState extends HomeTabState {
  Failure failure;
  HomeBrandsErrorState({required this.failure});
}

class HomeBrandsSuccessState extends HomeTabState {
  BrandsEntity brandEntity;

  HomeBrandsSuccessState({required this.brandEntity});
}

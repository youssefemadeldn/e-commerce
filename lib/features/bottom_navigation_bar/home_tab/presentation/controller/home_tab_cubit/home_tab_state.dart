import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/domain/entity/category_entity.dart';

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

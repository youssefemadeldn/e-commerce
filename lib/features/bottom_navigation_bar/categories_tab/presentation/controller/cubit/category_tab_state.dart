part of 'category_tab_cubit.dart';

sealed class CategoryTabState extends Equatable {
  const CategoryTabState();

  @override
  List<Object> get props => [];
}

final class CategoryTabInitialState extends CategoryTabState {}

final class CategoryTabLoadingState extends CategoryTabState {}

final class CategoryTabErrorState extends CategoryTabState {
  final Failure failure;
  const CategoryTabErrorState({required this.failure});
}

final class CategoryTabSuccessState extends CategoryTabState {
  final ProductsEntity productEntity;

  const CategoryTabSuccessState({required this.productEntity});
}

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/categories_tab/domain/entity/products_enity.dart';
import 'package:e_commerce/features/categories_tab/domain/use_cases/get_all_products_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_tab_state.dart';

class CategoryTabCubit extends Cubit<CategoryTabState> {
  GetAllProductsUseCase getAllProductsUseCase;
  List<ProductDataEntity> productsList = [];

  CategoryTabCubit({required this.getAllProductsUseCase})
      : super(CategoryTabInitialState());

  void getAllProducts() async {
    emit(CategoryTabLoadingState());
    var either = await getAllProductsUseCase.invoke();

    either.fold(
        (failure) => emit(
              CategoryTabErrorState(failure: failure),
            ), (productEntity) {
      productsList = productEntity.data ?? [];
      emit(
        CategoryTabSuccessState(productEntity: productEntity),
      );
    });
  }

  static CategoryTabCubit get(context) => BlocProvider.of(context);
}

import 'package:e_commerce/features/bottom_navigation_bar/home_tab/domain/entity/brands_entity.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/domain/entity/category_entity.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/domain/use_case/get_all_brands_use_case.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/domain/use_case/get_all_categories_use_case.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/presentation/controller/home_tab_cubit/home_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  List<DataCategoryEntity> categoriesList = [];
  List<DataBrandsEntity> brandsList = [];
  HomeTabCubit({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTabInitialState());

  void getAllCategories() async {
    emit(HomeTabInitialState());
    emit(HomeCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();

    either.fold(
        (failure) => emit(
              HomeCategoriesErrorState(failure: failure),
            ), (categoryModel) {
      categoriesList = categoryModel.data!;

      if (categoriesList.isNotEmpty) {
        emit(HomeCategoriesSuccessState(categoryEntity: categoryModel));
      }
    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();

    either.fold(
      (failure) => emit(
        HomeBrandsErrorState(failure: failure),
      ),
      (brandsEntity) {
        brandsList = brandsEntity.data!;
        if (brandsList.isNotEmpty) {
          emit(HomeBrandsSuccessState(brandEntity: brandsEntity));
        }
      },
    );
  }
}

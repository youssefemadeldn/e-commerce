import 'package:e_commerce/features/bottom_navigation_bar/home_tab/domain/use_case/get_all_categories_use_case.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/presentation/controller/home_tab_cubit/home_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  HomeTabCubit({required this.getAllCategoriesUseCase})
      : super(HomeTabInitialState());
  void getAllCategories() async {
    emit(HomeCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();

    either.fold(
      (failure) => emit(
        HomeCategoriesErrorState(failure: failure),
      ),
      (categoryModel) => emit(
        HomeCategoriesSuccessState(categoryEntity: categoryModel),
      ),
    );
  }
}

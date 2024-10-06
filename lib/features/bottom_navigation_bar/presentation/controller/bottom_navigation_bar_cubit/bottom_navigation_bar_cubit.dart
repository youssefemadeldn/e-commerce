import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/categories_tab/presentation/view/categories_tab.dart';
import 'package:e_commerce/features/bottom_navigation_bar/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce/features/bottom_navigation_bar/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce/features/favourite_tab/presentation/favourite_tab.dart';
import 'package:e_commerce/features/home_tab/presentation/screen/home_tab.dart';
import 'package:e_commerce/features/profile_tab/presentation/profile_tab.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'bottom_navigation_bar_state.dart';

@injectable
class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  AddToCartUseCase addToCartUseCase;
  int numOfCartItem = 0;
  int currentIndex = 0;
  List tabs = [
    HomeTab(),
    const CategoriesTab(),
    const FavoriteScreen(),
    const ProfileTab(),
  ];
  BottomNavigationBarCubit({required this.addToCartUseCase})
      : super(BottomNavigationBarInitialState());

  void changeSelectedIndex(int selectedIndex) {
    emit(BottomNavigationBarInitialState());
    currentIndex = selectedIndex;
    emit(BottomNavigationBarChangeIndexState());
  }

  void addToCartItem(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);

    either.fold((failure) {
      emit(AddToCartErrorState(failure: failure));
    }, (addToCartEntity) {
      numOfCartItem = addToCartEntity.numOfCartItems!.toInt();
      emit(AddToCartSuccessState(addToCartEntity: addToCartEntity));
    });
  }
}

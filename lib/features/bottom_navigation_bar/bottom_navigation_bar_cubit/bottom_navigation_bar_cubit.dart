import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/bottom_navigation_bar/categories_tab/presentation/categories_tab.dart';
import 'package:e_commerce/features/bottom_navigation_bar/favourite_tab/presentation/favourite_tab.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/presentation/screen/home_tab.dart';
import 'package:e_commerce/features/bottom_navigation_bar/profile_tab/presentation/profile_tab.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitialState());
  int currentIndex = 0;
  List tabs = [
    HomeTab(),
    const CategoriesTab(),
    const FavoriteScreen(),
    const ProfileTab(),
  ];

  void changeSelectedIndex(int selectedIndex) {
    emit(BottomNavigationBarInitialState());
    currentIndex = selectedIndex;
    emit(BottomNavigationBarChangeIndexState());
  }
}

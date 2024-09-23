import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:e_commerce/core/utils/components/home_screen_app_bar.dart';
import 'package:e_commerce/features/bottom_navigation_bar/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});

  BottomNavigationBarCubit viewModel = BottomNavigationBarCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      extendBody: false,
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is BottomNavigationBarChangeIndexState) {
            return viewModel.tabs[viewModel.currentIndex];
          }
          return Container();
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: (value) => viewModel.changeSelectedIndex(value),
            backgroundColor: ColorManager.primary,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: ColorManager.white,
            showSelectedLabels: false, // Hide selected item labels
            showUnselectedLabels: false, // Hide unselected item labels
            items: [
              // Build BottomNavigationBarItem widgets for each tab
              CustomBottomNavBarItem(IconsAssets.icHome, "Home"),
              CustomBottomNavBarItem(IconsAssets.icCategory, "Category"),
              CustomBottomNavBarItem(IconsAssets.icWithList, "WishList"),
              CustomBottomNavBarItem(IconsAssets.icProfile, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;
  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath), // Inactive icon image
            color: ColorManager.white, // Inactive icon color
          ),
          activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white, // Background of active icon
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager
                  .primary, // Active icon imagecolor: ColorManager.primary, // Active icon color
            ),
          ),
        );
}

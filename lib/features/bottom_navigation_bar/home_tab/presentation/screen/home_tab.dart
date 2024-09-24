import 'dart:async';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:e_commerce/features/auth/di/di_auth.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/presentation/controller/home_tab_cubit/home_tab_cubit.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/presentation/controller/home_tab_cubit/home_tab_state.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/presentation/widgets/custom_ads_widget.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/presentation/widgets/custom_brand_widget.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/presentation/widgets/custom_category_widget.dart';
import 'package:e_commerce/features/bottom_navigation_bar/home_tab/presentation/widgets/custom_section_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  HomeTabCubit viewModel = getIt<HomeTabCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabState>(
      bloc: viewModel..getAllCategories(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const CustomAdsWidget(),
              CustomSectionBar(sectionNname: 'Categories', function: () {}),
              state is HomeCategoriesSuccessState
                  ? SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCategoryWidget(
                            category: state.categoryEntity.data![index],
                          );
                        },
                        itemCount: state.categoryEntity.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primaryDark,
                      ),
                    ),
              SizedBox(height: 12.h),
              CustomSectionBar(sectionNname: 'Brands', function: () {}),
              SizedBox(
                height: 270.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CustomBrandWidget();
                  },
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ),
              // CustomSectionBar(
              //   sectionNname: 'Most Selling Products',
              //   function: () {},
              // ),
              // SizedBox(
              //   child: SizedBox(
              //     height: 360.h,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return const ProductCard(
              //           title: "Nike Air Jordon",
              //           description:
              //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
              //           rating: 4.5,
              //           price: 1100,
              //           priceBeforeDiscound: 1500,
              //           image: ImageAssets.categoryHomeImage,
              //         );
              //       },
              //       itemCount: 20,
              //     ),
              //   ),
              // ),
              SizedBox(height: 12.h)
            ],
          ),
        );
      },
    );
  }
}

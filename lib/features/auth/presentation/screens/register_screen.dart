import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:e_commerce/core/utils/components/custom_elevated_button.dart';
import 'package:e_commerce/core/utils/components/main_text_field.dart';
import 'package:e_commerce/core/utils/components/validators.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:e_commerce/features/auth/di/di_auth.dart';
import 'package:e_commerce/features/auth/presentation/controllers/register_cubit/register_cubit.dart';
import 'package:e_commerce/features/auth/presentation/controllers/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatelessWidget {
  RegisterCubit viewModel = getIt<RegisterCubit>();
  var registerFormKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     WidgetsBinding.instance.addPostFrameCallback((_) {
          //       // Add Your Code here.
          //       Navigator.pop(context);
          //       showDialog(
          //         context: context,
          //         builder: (context) => AlertDialog(
          //           backgroundColor: ColorManager.white,
          //           title: const Text("Loading"),
          //           content: const Center(
          //             child: CircularProgressIndicator(
          //               color: Colors.blue,
          //             ),
          //           ),
          //           actions: [
          //             ElevatedButton(
          //               onPressed: () {
          //                 Navigator.pop(context);
          //               },
          //               child: const Text("Okay"),
          //             ),
          //           ],
          //         ),
          //       );
          //     });
          //     return Container();
          //   },
          // );

          DialogUtils.showLoading(
            context,
            "Loading",
          );
        } else if (state is RegisterErrorState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // showDialog(
            //   context: context,
            //   builder: (context) => AlertDialog(
            //     // backgroundColor:
            //     //     AppColors.backgroundLightColor,
            //     title: const Text("Error"),
            //     content: Text(state.failure.errorMessage),
            //     actions: [
            //       ElevatedButton(
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //         child: const Text("Okay"),
            //       ),
            //     ],
            //   ),
            // );
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.failure.errorMessage);
          });
        } else if (state is RegisterSuccessState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Add Your Code here.

            // showDialog(
            //   context: context,
            //   builder: (context) => AlertDialog(
            //     // backgroundColor:
            //     //     AppColors.backgroundLightColor,
            //     title: const Text("Success"),
            //     content: const Text('Register Successfully'),
            //     actions: [
            //       ElevatedButton(
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //         child: const Text("Ok"),
            //       ),
            //     ],
            //   ),
            // );
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, 'Register Successfully');
          });
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Form(
                key: registerFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    BuildTextField(
                      controller: viewModel.nameController,
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: viewModel.phoneController,
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: viewModel.emailController,
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: viewModel.passwordController,
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: viewModel.rePasswordController,
                      hint: 'enter your rePassword',
                      backgroundColor: ColorManager.white,
                      label: 'rePassword',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s20),
                          onTap: () {
                            if (registerFormKey.currentState!.validate()) {
                              viewModel.register();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

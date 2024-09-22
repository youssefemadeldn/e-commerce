import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:e_commerce/core/utils/components/custom_elevated_button.dart';
import 'package:e_commerce/core/utils/components/main_text_field.dart';
import 'package:e_commerce/core/utils/components/validators.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/font_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:e_commerce/features/auth/di/di_auth.dart';
import 'package:e_commerce/features/auth/presentation/controllers/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginCubit viewModel = getIt<LoginCubit>();
  var loginFormKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context, 'Loading');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.failure.errorMessage,
              title: 'Error', posActionName: 'Ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context,
            'Login Successfully',
            title: 'Success',
            posActionName: 'Ok',
            posAction: () => Navigator.pushNamedAndRemoveUntil(
                context, Routes.mainRoute, (route) => false),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Form(
                key: loginFormKey,
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
                    Text(
                      'Welcome Back To Route',
                      style: getBoldStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s24.sp),
                    ),
                    Text(
                      'Please sign in with your mail',
                      style: getLightStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s16.sp),
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    BuildTextField(
                      controller: viewModel.email,
                      backgroundColor: ColorManager.white,
                      hint: 'enter your email',
                      label: 'Email',
                      textInputType: TextInputType.emailAddress,
                      validation: AppValidators.validateEmail,
                    ),
                    SizedBox(
                      height: AppSize.s28.h,
                    ),
                    BuildTextField(
                      controller: viewModel.password,
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'Password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s8.h,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forget password?',
                              style: getMediumStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s18.sp),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s60.h,
                    ),
                    Center(
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width * .8,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          isStadiumBorder: false,
                          label: 'Login',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s18),
                          onTap: () {
                            if (loginFormKey.currentState!.validate()) {
                              viewModel.login();
                            }
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, Routes.mainRoute, (route) => false);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(
                          width: AppSize.s8.w,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.signUpRoute),
                          child: Text(
                            'Create Account',
                            style: getSemiBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s16.sp),
                          ),
                        ),
                      ],
                    )
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

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/entity/login_entity.dart';
import 'package:e_commerce/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  var email = TextEditingController(text: 'jo90@gmail.com');
  var password = TextEditingController(text: 'Jo12345678');
  LoginCubit(this.loginUseCase) : super(LoginInitialState());

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(email.text, password.text);

    either.fold(
      (failure) => emit(
        LoginErrorState(
          failure: failure,
        ),
      ),
      (loginModel) => emit(
        LoginSuccessState(loginEntity: loginModel),
      ),
    );
  }
}

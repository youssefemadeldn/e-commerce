import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/domain/usecases/register_use_case.dart';
import 'package:e_commerce/features/auth/presentation/controllers/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  var nameController = TextEditingController(text: 'youssef');
  var emailController = TextEditingController(text: 'Jo90@gmail.com');
  var passwordController = TextEditingController(text: 'Jo12345678');
  var rePasswordController = TextEditingController(text: 'Jo12345678');
  var phoneController = TextEditingController(text: '01271944961');
  RegisterCubit({required this.registerUseCase})
      : super(RegisterInitialState());

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);

    either.fold(
      (failure) => emit(
        RegisterErrorState(failure: failure),
      ),
      (registerModel) => emit(
        RegisterSuccessState(registerEntity: registerModel),
      ),
    );
  }
}

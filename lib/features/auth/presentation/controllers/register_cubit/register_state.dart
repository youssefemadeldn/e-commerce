import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/entity/register_entity.dart';

abstract class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterErrorState extends RegisterState {
  Failure failure;
  RegisterErrorState({required this.failure});
}

final class RegisterSuccessState extends RegisterState {
  RegisterEntity registerEntity;
  RegisterSuccessState({required this.registerEntity});
}

import 'package:e_commerce/features/auth/domain/entity/sign_up_entity.dart';

abstract class AuthRepo {
  Future<bool> signIn(String email, String password);
  Future<bool> signUp(SignUpEntity signUpEntity);
}

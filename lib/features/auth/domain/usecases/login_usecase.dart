import 'package:e_commerce/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase {
  AuthRepo repo;

  LoginUseCase(this.repo);

  Future<bool> call(String email, String password) =>
      repo.signIn(email, password);
}

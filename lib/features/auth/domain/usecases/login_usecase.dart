import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<String> executeLogin(String username, String password) {
    return repository.login(username, password);
  }
}

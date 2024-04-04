import 'package:app_filmes/repository/login/login_repository.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<UserCredential> login() => _loginRepository.login();
}

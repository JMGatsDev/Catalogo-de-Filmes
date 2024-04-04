import 'package:app_filmes/repository/login/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepositoryImpl implements LoginRepository{
  @override
  Future<UserCredential> login() async{
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      return FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      throw Exception('Erros ao realizar login com o google');
    }
  }

}
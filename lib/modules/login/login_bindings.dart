import 'package:app_filmes/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    // lazyput avisa que vai ser instaciado, mas deixa em espera
    Get.lazyPut(
      () => LoginController(
        loginService: Get.find(),
      ),
    );
  }
}

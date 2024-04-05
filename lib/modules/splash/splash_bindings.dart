import 'package:app_filmes/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    //put instacia e deixa disponivel assim que entra na tela
    Get.put(SplashController());
  }
}

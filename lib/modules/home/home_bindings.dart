import 'package:app_filmes/modules/home/homer_controller.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    //put instacia e deixa disponivel assim que entra na tela
    Get.put(HomeController());
  }
}

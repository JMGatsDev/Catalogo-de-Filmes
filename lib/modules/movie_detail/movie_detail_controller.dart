import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController with LoaderMixin, MessagesMixin{
var loading = false.obs;
var message = Rxn<MessageModel>();


@override
  void onInit() {

    super.onInit();
    loaderListener(loading);
    messageListener(message);


  }

}
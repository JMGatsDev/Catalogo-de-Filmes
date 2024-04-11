import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:app_filmes/repository/genres/genres_repository.dart';
import 'package:app_filmes/repository/genres/genres_repository_impl.dart';
import 'package:app_filmes/services/genres/genres_services.dart';
import 'package:app_filmes/services/genres/genres_services_impl.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GeresRepositoryImpl(restClient: Get.find()));

    Get.lazyPut<GenresServices>(
        () => GenresServicesImpl(geresRepository: Get.find()));

    Get.lazyPut(() => MoviesController(genresServices: Get.find()));
  }
}

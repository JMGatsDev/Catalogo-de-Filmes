import 'package:app_filmes/application/models/genre_model.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/genres/genres_services.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;
  final GenresServices _genresServices;
  MoviesController({required GenresServices genresServices})
      : _genresServices = genresServices;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final genres = await _genresServices.getGenres();
      this.genres.assignAll(genres);
    } on Exception catch (e) {
      _message(MessageModel.error(
          title: 'Erro: $e ', message: 'Erro ao Buscar categorias'));
    }
  }
}

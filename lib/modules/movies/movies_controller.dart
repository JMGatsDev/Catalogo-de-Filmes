import 'package:app_filmes/application/models/genre_model.dart';
import 'package:app_filmes/application/models/movie_model.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/genres/genres_services.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final _message = Rxn<MessageModel>();
  final MoviesService _moviesService;

  final genres = <GenreModel>[].obs;
  final GenresServices _genresServices;

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  final _popularMoviesOriginal = <MovieModel>[].obs;
  final _topRatedMoviesOriginal = <MovieModel>[].obs;
  MoviesController(
      {required MoviesService moviesService, required GenresServices genresServices})
      : _genresServices = genresServices,
        _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final genresData = await _genresServices.getGenres();
      final popularMoviesData = await _moviesService.getPopularMovies();
      final topRatedMoviesData = await _moviesService.getTopRated();

      genres.assignAll(genresData);
      popularMovies.assignAll(popularMoviesData);
      topRatedMovies.assignAll(topRatedMoviesData);
    } catch (e,s) {
      print(e);
      print(s);
      _message(
        MessageModel.error(
            title: 'Erro: $e ', message: 'Erro ao Carregar Dados da pagina'),
      );
    }
  }
}

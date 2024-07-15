import 'package:app_filmes/application/auth/auth_service.dart';
import 'package:app_filmes/application/models/genre_model.dart';
import 'package:app_filmes/application/models/movie_model.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/genres/genres_services.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final _message = Rxn<MessageModel>();
  final MoviesService _moviesService;
  final GenresServices _genresServices;
  final AuthService _authService;

  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();

  MoviesController(
      {required MoviesService moviesService,
      required GenresServices genresServices,
      required AuthService authService})
      : _genresServices = genresServices,
        _moviesService = moviesService,
        _authService = authService;

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
      genres.assignAll(genresData);

      await getMovies();
    } catch (e, s) {
      print(e);
      print(s);
      _message(
        MessageModel.error(
            title: 'Erro: $e ', message: 'Erro ao Carregar Dados da pagina'),
      );
    }
  }

  Future<void> getMovies() async {
    var popularMoviesData = await _moviesService.getPopularMovies();
    var topRatedMoviesData = await _moviesService.getTopRated();
    final favorites = await getFavorities();

    popularMoviesData = popularMoviesData.map((m) {
      if (favorites.containsKey(m.id)) {
        return m.copyWith(favorite: true);
      } else {
        return m.copyWith(favorite: false);
      }
    }).toList();

    topRatedMoviesData = topRatedMoviesData.map((m) {
      if (favorites.containsKey(m.id)) {
        return m.copyWith(favorite: true);
      } else {
        return m.copyWith(favorite: false);
      }
    }).toList();

    popularMovies.assignAll(popularMoviesData);
    _popularMoviesOriginal = popularMoviesData;
    topRatedMovies.assignAll(topRatedMoviesData);
    _topRatedMoviesOriginal = topRatedMoviesData;
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    if (genreModel?.id == genreSelected.value?.id) {
      genreModel = null;
    }
    genreSelected.value = genreModel;

    if (genreModel != null) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreModel?.id);
      });
      var newTopRatedMovies = _topRatedMoviesOriginal.where((movie) {
        return movie.genres.contains(genreModel?.id);
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
      popularMovies.refresh();
      topRatedMovies.refresh();
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
      popularMovies.refresh();
      topRatedMovies.refresh();
    }
  }

  Future<void> favoriteMovie(MovieModel movieModel) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = movieModel.copyWith(favorite: !movieModel.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorities() async {
    var user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoritiesMovies(user.uid);
      return <int, MovieModel>{for (var fav in favorites) fav.id: fav};
    }
    return {};
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoritiesMovies(user.uid);
      return <int, MovieModel>{
        for (var fav in favorites) fav.id: fav,
      };
    }
    return {};
  }
}

import 'package:app_filmes/application/auth/auth_service.dart';
import 'package:app_filmes/application/models/movie_model.dart';
import 'package:app_filmes/services/movies/movies_service.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  var movies = <MovieModel>[].obs;

  FavoritesController(
      {required MoviesService moviesService, required AuthService authService})
      : _moviesService = moviesService,
        _authService = authService;

  @override
  void onReady() async{
    super.onReady();
  getFavorites();
  }

  Future<void>getFavorites ()async {
    var user = _authService.user;
    if (user != null) {
      var favorites = await _moviesService.getFavoritiesMovies(user.uid);
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorite(MovieModel movieModel)async{
var user = _authService.user;
    if (user != null) {
     await _moviesService.addOrRemoveFavorite(user.uid,movieModel.copyWith(favorite: false));
    movies.remove(movieModel);
    }


  }
}

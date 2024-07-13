import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:app_filmes/application/models/movie_model.dart';

abstract interface class MoviesService {

//Filmes populares
Future<List<MovieModel>> getPopularMovies();
//Top Filmes
Future<List<MovieModel>> getTopRated();
Future<MovieDetailModel?> getDetail(int id);

Future<void> addOrRemoveFavorite(String userId, MovieModel movieModel) ;

  Future<List<MovieModel>>getFavoritiesMovies(String userId);

}

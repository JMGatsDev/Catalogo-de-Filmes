import 'package:app_filmes/application/models/movie_model.dart';

abstract interface class MoviesService {

//Filmes populares
Future<List<MovieModel>> getPopularMovies();
//Top Filmes
Future<List<MovieModel>> getTopRated();

}

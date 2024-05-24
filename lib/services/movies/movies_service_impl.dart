import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:app_filmes/application/models/movie_model.dart';
import 'package:app_filmes/repository/movies/movies_repository.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  MoviesServiceImpl({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  final MoviesRepository _moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesRepository.getTopRated();

  @override
  Future<MovieDetailModel?> getDetail(int id) =>_moviesRepository.getDetail(id);
}

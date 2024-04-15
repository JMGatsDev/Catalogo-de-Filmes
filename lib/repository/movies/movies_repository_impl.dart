import 'package:app_filmes/application/models/movie_model.dart';
import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final results = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }
        return <MovieModel>[];
      },
    );
    if (results.hasError) {
      print('Erro ao buscar popular movies [${results.statusText}]');
      throw Exception('Erro ao buscar Filmes Populares');
    }
    return results.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated()async {


    final results = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
        }
        return <MovieModel>[];
      },
    );
    if (results.hasError) {
      print('Erro ao buscar Top movies [${results.statusText}]');
      throw Exception('Erro ao buscar Top Filmes');
    }
    return results.body ?? <MovieModel>[];

    
  }
}

import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:app_filmes/application/models/movie_model.dart';
import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<List<MovieModel>> getTopRated() async {
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

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClient.get<MovieDetailModel?>(
      '/movie/$id',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br'
      },
      decoder: (data) {
        return MovieDetailModel.fromMap(data);
      },
    );
    if (result.hasError) {
      print('Erro ao buscar detalhes do filme [${result.statusText}]');
      throw Exception('Erro ao buscar detalhes do Filme');
    }
    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movieModel) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorities')
          .doc(userId)
          .collection('movies');
      if (movieModel.favorite == true) {
        favoriteCollection.add(movieModel.toMap());
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movieModel.id)
            .limit(1)
            .get();
        favoriteData.docs.first.reference.delete();
      }
    } catch (e) {
      print('Erro ao Favoritar Filme');
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) async {
    var favoritesMovies = await FirebaseFirestore.instance
        .collection('favorities')
        .doc(userId)
        .collection('movies')
        .get();

    final listFavorites = <MovieModel>[];
    for (var movie in favoritesMovies.docs) {
      listFavorites.add(
        MovieModel.fromMap(
          movie.data(),
        ),
      );
    }
    return listFavorites;
  }
}

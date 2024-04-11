import 'package:app_filmes/application/models/genre_model.dart';
import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/repository/genres/genres_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class GeresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GeresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<List<GenreModel>> getGeneres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      query: {'api_key': FirebaseRemoteConfig.instance.getString('api_token'), 'language' : 'pt-br'},
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenreModel>((g) => GenreModel.fromMap(g))
              .toList();
        }
        return <GenreModel>[];
      },
    );
    if (result.hasError) {
      print(result.statusText);
      throw Exception('Erro ao buscar Genres');
    }
    return result.body ?? <GenreModel>[];
  }
}

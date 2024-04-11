import 'package:app_filmes/application/models/genre_model.dart';
import 'package:app_filmes/repository/genres/genres_repository.dart';

import './genres_services.dart';

class GenresServicesImpl implements GenresServices {
  final GenresRepository _genresRepository;

  GenresServicesImpl({required GenresRepository geresRepository})
      : _genresRepository = geresRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGeneres();

}
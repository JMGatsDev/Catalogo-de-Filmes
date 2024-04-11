import 'package:app_filmes/application/models/genre_model.dart';

abstract interface class GenresRepository {

  Future<List<GenreModel>> getGeneres();

}
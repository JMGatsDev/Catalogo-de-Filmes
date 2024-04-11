import 'package:app_filmes/application/models/genre_model.dart';

abstract interface class GenresServices {
  Future<List<GenreModel>> getGenres();
}

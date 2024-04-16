import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:app_filmes/modules/movies/widgets/movies_filters.dart';
import 'package:app_filmes/modules/movies/widgets/movies_grup.dart';
import 'package:app_filmes/modules/movies/widgets/movies_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          MoviesHeader(),
          MoviesFilters(),
          MoviesGrup(title: 'Mais Populares', movies: controller.popularMovies),
          MoviesGrup(
            title: 'Top Filmes',
            movies: controller.topRatedMovies,
          ),
        ],
      ),
    );
  }
}

import 'package:app_filmes/modules/movies/widgets/movies_filters.dart';
import 'package:app_filmes/modules/movies/widgets/movies_grup.dart';
import 'package:app_filmes/modules/movies/widgets/movies_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: const [
          MoviesHeader(),
          MoviesFilters(),
          MoviesGrup(title: 'Mais Populares',),
          MoviesGrup(title: 'Top Filmes',),
        ],
      ),
    );
  }
}

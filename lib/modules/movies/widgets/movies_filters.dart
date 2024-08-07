import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:app_filmes/modules/movies/widgets/filte_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesFilters extends GetView<MoviesController> {
   const MoviesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() {
          return Row(
            children: controller.genres
                .map((g) => FilterTag(
                      model: g,
                      onpressed: () => controller.filterMoviesByGenre(g),
                      selected: controller.genreSelected.value?.id == g.id,
                    ))
                .toList(),
          );
        }),
      ),
    );
  }
}

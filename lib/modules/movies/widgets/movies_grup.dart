import 'package:app_filmes/application/models/movie_model.dart';
import 'package:app_filmes/application/ui/widgets/movie_card.dart';
import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGrup extends GetView<MoviesController> {
  const MoviesGrup({super.key, required this.title, required this.movies});
  final List<MovieModel> movies;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              height: Get.height * 0.315,
              child: Obx(() {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      var movie = movies[index];
                      return MovieCard(
                          movie: movie,
                          favoriteCallBack: () =>
                              controller.favoriteMovie(movie));
                    });
              }),), //shrinkWrap Recalcula o tamanho do list
        ],
      ),
    );
  }
}

import 'package:app_filmes/application/models/movie_model.dart';
import 'package:app_filmes/application/ui/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGrup extends StatelessWidget {
  const MoviesGrup({super.key, required this.title, required this.movies});
  final List<MovieModel>movies;
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
                              return  MovieCard(movie: movies[index],);
                            });
                }
              )
          ), //shrinkWrap Recalcula o tamanho do list
        ],
      ),
    );
  }
}

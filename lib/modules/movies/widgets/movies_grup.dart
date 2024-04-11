import 'package:app_filmes/application/ui/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGrup extends StatelessWidget {
  const MoviesGrup({super.key, required this.title});
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
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const MovieCard();
                }),
          ), //shrinkWrap Recalcula o tamanho do list
        ],
      ),
    );
  }
}

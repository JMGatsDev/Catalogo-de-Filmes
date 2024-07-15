import 'package:app_filmes/application/models/movie_model.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  MovieCard({super.key, required this.movie, required this.favoriteCallBack});
  final dateFormat = DateFormat('dd/MM/y');
  final MovieModel movie;
  final VoidCallback favoriteCallBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/movie/detail', arguments: movie.id);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: Get.width * 0.37,
        height: Get.height * 0.31,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                        width: Get.width * 0.37,
                        height: Get.height * 0.21,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w200${movie.posterPath}'),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Text(
                  movie.title,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  dateFormat.format(DateTime.parse(movie.releaseDate)),
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ],
            ),
            Positioned(
              bottom: 65,
              right: -10,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: Get.height * 0.04,
                  child: IconButton(
                    iconSize: 13,
                    icon: Icon(
                      movie.favorite ? Icons.favorite : Icons.favorite_border,
                      color: movie.favorite == true
                          ? context.ThemeRed
                          : context.ThemeGrey,
                    ),
                    onPressed: favoriteCallBack,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

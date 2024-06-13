import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;

  MovieDetailHeader({
    Key? key,
    required this.movieDetailModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var movieData = movieDetailModel;
    if (movieData != null) {
      return SizedBox(
        height: height * 0.37,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieData.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieData.urlImages[index];
            return Padding(
              padding: EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    } else {
      return SizedBox.shrink(
        child: Container(
          color: Colors.amber,
        ),
      );
    }
  }
}

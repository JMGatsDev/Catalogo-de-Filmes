import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;

  const MovieDetailHeader({
    super.key,
    required this.movieDetailModel,
  });

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
              padding: const EdgeInsets.all(2),
              child: FadeInImage.memoryNetwork(image: image,placeholder: kTransparentImage,),
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

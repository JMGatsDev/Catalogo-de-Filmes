import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class MovieDatailContentTitle extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;

  const MovieDatailContentTitle({super.key, required this.movieDetailModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.005,
          ),
          Text(
            movieDetailModel?.title ?? '',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          RatingStars(
            value: (movieDetailModel?.stars ?? 1) / 2,
            valueLabelVisibility: false,
            starColor: context.ThemeOrange,
            starSize: 14,
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Text(
            movieDetailModel?.genres.map((e) => e.name).join(', ') ?? '',
            style: TextStyle(fontSize: 11, color: context.ThemeGrey),
          )
        ],
      ),
    );
  }
}

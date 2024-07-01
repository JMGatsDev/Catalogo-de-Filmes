import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:app_filmes/modules/movie_detail/widget/movie_datail_content/movie_datail_content_credits.dart';
import 'package:app_filmes/modules/movie_detail/widget/movie_datail_content/movie_datail_content_title.dart';
import 'package:flutter/material.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;

  const MovieDetailContent({super.key, required this.movieDetailModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDatailContentTitle(movieDetailModel: movieDetailModel,),
        MovieDatailContentCredits(movieDetailModel: movieDetailModel,),
      ],
    );
  }
}

import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDatailContentCredits extends StatelessWidget {
  final MovieDetailModel? movieDetailModel;

  const MovieDatailContentCredits({super.key, required this.movieDetailModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 50),
        child: Text(movieDetailModel?.overview ?? '',style: TextStyle(fontSize: 14,height: 1.3),),
      ),
    );
  }
}

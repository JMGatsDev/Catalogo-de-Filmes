import 'package:app_filmes/application/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailContentProductionComponies extends StatelessWidget {
  const MovieDetailContentProductionComponies(
      {super.key, required this.movieDetailModel});
  final MovieDetailModel? movieDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
            text: 'Companhia(S) produtora(s)',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF222222),
            ),
            children: [
              TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.normal),
                  text: movieDetailModel?.productionCompanies.join(', ') ?? '')
            ]),
      ),
    );
  }
}

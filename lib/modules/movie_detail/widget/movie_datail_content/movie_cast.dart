import 'package:app_filmes/application/models/cast_model.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({super.key, this.castModel});
  final CastModel? castModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.3,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              castModel?.image ?? "Carregando",
              width: width * 0.2,
              height: height * 0.15,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            castModel?.name ?? "",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            castModel?.character ?? "",
            style: TextStyle(
              fontSize: 14,
              color: context.ThemeGrey,
            ),
          ),
        ],
      ),
    );
  }
}

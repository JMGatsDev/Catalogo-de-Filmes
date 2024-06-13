import 'package:app_filmes/modules/movie_detail/widget/movie_detail_content.dart';
import 'package:app_filmes/modules/movie_detail/widget/movie_detail_header.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(child: Obx(() {
        return Column(
          children: [
            MovieDetailHeader(
              movieDetailModel: controller.movie.value,
            ),
            MovieDetailContent(
              movieDetailModel: controller.movie.value,
            )
          ],
        );
      })),
    );
  }
}

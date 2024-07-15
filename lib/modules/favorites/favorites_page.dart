import 'package:app_filmes/application/ui/widgets/movie_card.dart';
import 'package:app_filmes/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Placeholder(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, //Retirar o botão de voltar
            title: Text('Meus Favoritos'),
          ),
          body: Obx(() => SingleChildScrollView(
                child: SizedBox(
                  width: Get.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: controller.movies
                        .map(
                          (m) => MovieCard(
                            movie: m,
                            favoriteCallBack: () =>
                                controller.removeFavorite(m),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ))),
    );
  }
}

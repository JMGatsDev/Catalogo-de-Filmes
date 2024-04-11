import 'package:app_filmes/modules/favorites/favorites_page.dart';
import 'package:app_filmes/modules/home/home_controller.dart';
import 'package:app_filmes/modules/movies/movies_bindings.dart';
import 'package:app_filmes/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          selectedItemColor: context.ThemeRed,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_movies), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: 'Sair'),
          ],
        );
      }),
      body: Navigator(
        //Navegando entre as paginas
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
                settings: settings,
                page: () => const MoviesPage(),
                binding: MoviesBindings());
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
                settings: settings, page: () => const FavoritesPage());
          }
          return null;
        },
      ),
    );
  }
}

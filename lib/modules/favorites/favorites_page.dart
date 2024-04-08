import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,//Retirar o botão de voltar
          title: const Text('Meus Favoritos'),
        ),
        body: const Center(
          child: Text('Favoritos'),
        ),
      ),
    );
  }
}

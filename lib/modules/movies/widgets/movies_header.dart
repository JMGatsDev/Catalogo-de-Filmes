import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesHeader extends GetView<MoviesController> {
   const MoviesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.25,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: Get.width * 0.9,
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Procurar Filmes',
                  labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: EdgeInsets.zero,
                  floatingLabelBehavior: FloatingLabelBehavior.never),
              onChanged: (value) => controller.filterByName(value),
            ),
          ),
        ],
      ),
    );
  }
}

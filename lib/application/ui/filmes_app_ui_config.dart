import 'package:flutter/material.dart';
// thema do aplicativo
class FilmesAllUiConfig {
//Não Permite que a class seja instaciada
  FilmesAllUiConfig._();

  static String get title => 'Filmes App';

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Color(0xff222222),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      );
}

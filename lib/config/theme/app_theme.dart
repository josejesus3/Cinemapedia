import 'package:flutter/material.dart';

List<Color> colorsList = [
  Colors.black,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.orange,
  Colors.red,
  Colors.pink,
];

class AppTheme {
  final int selectColor;
  final bool isDrack;
  AppTheme({this.selectColor = 0, this.isDrack = true})
      : assert(selectColor >= 0, 'SelectColor entre 0 y ${colorsList.length}'),
        assert(selectColor < colorsList.length,
            'Seleccolors menor que ${colorsList.length}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDrack ? Brightness.light : Brightness.dark,
        colorSchemeSeed: colorsList[selectColor],
      );
}

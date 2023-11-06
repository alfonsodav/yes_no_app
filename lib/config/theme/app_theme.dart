import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.deepPurple,
];

const Color _customColor = Color(0xD85E0BBD);

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colors must be between 0 and ${_colorThemes.length - 1}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed:
          _colorThemes[selectedColor], /* brightness: Brightness.dark */
    );
  }
}

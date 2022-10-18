import 'package:flutter/material.dart';

class VakinhaUi {
  const VakinhaUi._();

  static final themeData = ThemeData(
    primaryColor: const Color(0xFF007D21),
    primaryColorDark: const Color(0xFF00343F),
    fontFamily: 'mplus1',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF007D21),
        textStyle: const TextStyle(fontFamily: 'mplus1'),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      selectedLabelStyle: boldText,
      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
    ),
  );

  static const boldText = TextStyle(fontWeight: FontWeight.bold);
}

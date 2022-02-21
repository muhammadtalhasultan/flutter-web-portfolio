import 'package:client_portfolio/constraints/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode =ThemeMode.dark; //by default I set the theme mode in dark

  bool get isDarkMode =>themeMode == ThemeMode.dark; //to get current theme mode

  //to change Theme mode
  void changeTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: navy_color,
    cardTheme: CardTheme(color: light_navy_color, shadowColor: Colors.black87),
    colorScheme: ColorScheme.dark(),
    primaryColor: Colors.white.withOpacity(0.5),
    iconTheme: IconThemeData(color: Colors.white70),
    textTheme: GoogleFonts.interTextTheme(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    primaryColor: Colors.black,
    cardTheme: CardTheme(color: Colors.white, shadowColor: Colors.blueGrey[900]),
    iconTheme: IconThemeData(color: Colors.black.withOpacity(0.8)),
    textTheme: GoogleFonts.interTextTheme(),
  );
}

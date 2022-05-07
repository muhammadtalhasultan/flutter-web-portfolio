import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/themeProvider.dart';

class Light_Dark_Mode extends StatelessWidget {
  Light_Dark_Mode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.isDarkMode;

    return InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          isDark = !isDark;
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.changeTheme(isDark);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              isDark ? Icon(Icons.light_mode_outlined) : Icon(Icons.dark_mode),
        ));
  }
}

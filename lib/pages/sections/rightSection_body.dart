import 'package:client_portfolio/widgets/hoverUp.dart';
import 'package:client_portfolio/widgets/hoverItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constraints/colors.dart';
import '../../constraints/strings.dart';
import '../../providers/themeProvider.dart';

class SectionRight extends StatelessWidget {
  SectionRight({Key? key}) : super(key: key);

  late Color linkColor;
  late Color title_color;
  late Color desColor;
  late Color hoberIconColor;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    linkColor = themeProvider.isDarkMode ? index_color : light_index_color;
    desColor = themeProvider.isDarkMode ? salate_color : light_navy_color;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //to show gmail address top to bottom i use rotated box
            //hoverItem for change the text color when I hover
            HoverUp(
              child: HoverItem(
                builder: (isHovered) {
                  final hoverColor = isHovered ? linkColor : desColor;
                  return RotatedBox(
                      quarterTurns: 1,
                      child: InkWell(
                        onTap: () {},
                        hoverColor: Colors.transparent,
                        child: Text(
                          gmail_address,
                          style: TextStyle(color: hoverColor,fontSize: 13,letterSpacing: 2),
                        ),
                      ));
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              width: 2,
              color: salate_color,
            )
          ],
        ),
      ),
    );
  }
}

//this widget for show gmail address in my home page

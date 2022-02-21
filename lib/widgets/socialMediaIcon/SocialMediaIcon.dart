import 'package:client_portfolio/constraints/responsive.dart';
import 'package:client_portfolio/widgets/hoverItem.dart';
import 'package:client_portfolio/widgets/hoverUp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constraints/colors.dart';
import '../../providers/themeProvider.dart';

late Color heading_index_color;
late Color heading_title_color;

Widget socialMediaIcon(String url, IconData icon, BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);

  //here i pick color for social icon
  final themeprovider = Provider.of<ThemeProvider>(context);
  heading_index_color = themeprovider.isDarkMode? index_color: light_index_color.withOpacity(0.9);
  heading_title_color = themeprovider.isDarkMode? light_salate_color: navy_color;

  if (isMobile(context)) {
    return InkWell(
          onTap: () {
            _launchURL(url);
          },
          child: FaIcon(icon)
    );
  }
  else {
    return HoverItem(
        builder: (isHovered){
          final color=isHovered?heading_index_color:heading_title_color;
          return HoverUp(
            child: InkWell(
                onTap: () {
                  _launchURL(url);
                },
                child: FaIcon(icon,size: 20,color: color,)
            ),
          );
        }
    );
  }
}

void _launchURL(String url) async {
  if (!await launch(
    url,
    forceSafariVC: true,
    forceWebView: true,
    enableJavaScript: true,
  ))
  {
    throw 'Could not launch $url';
  }
}

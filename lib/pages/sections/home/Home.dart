import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_portfolio/constraints/colors.dart';
import 'package:client_portfolio/constraints/responsive.dart';
import 'package:client_portfolio/constraints/strings.dart';
import 'package:client_portfolio/providers/themeProvider.dart';
import 'package:client_portfolio/widgets/hoverUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeprovider =
        Provider.of<ThemeProvider>(context); //to know theme mode
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),

          //say hi
          Text(
            home_hi_text,
            style: TextStyle(
                fontSize: 18,
                color:
                    themeprovider.isDarkMode ? index_color : light_index_color),
          ),
          SizedBox(
            height: 20,
          ),

          //name text
          AutoSizeText(
            home_name,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: themeprovider.isDarkMode
                    ? lightest_salate_color
                    : dark_navy_color.withOpacity(0.7)),
            maxLines: 1,
            minFontSize: isMobile(context)
                ? 36
                : isTab(context)
                    ? 52
                    : 72,
          ),

          //title of my
          AutoSizeText(
            home_title,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: themeprovider.isDarkMode
                    ? light_salate_color
                    : navy_color.withOpacity(0.6)),
            maxLines: 2,
            minFontSize: isMobile(context)
                ? 36
                : isTab(context)
                    ? 52
                    : 72,
          ),
          SizedBox(
            height: 16,
          ),

          //my description
          Container(
            width: isMobile(context) ? size.width : size.width / 3,
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    children: [
                  TextSpan(
                    text: home_description,
                    style: TextStyle(
                        color: themeprovider.isDarkMode
                            ? salate_color
                            : light_navy_color.withOpacity(0.6)),
                  ),
                  TextSpan(
                    text: home_des_link_text,
                    style: TextStyle(
                      color: themeprovider.isDarkMode
                          ? index_color
                          : light_index_color,
                    ),
                    mouseCursor: SystemMouseCursors.click,
                    recognizer: TapGestureRecognizer()
                      ..onTap = launchUpstatement,
                  ),
                ])),
          ),
          SizedBox(
            height: 60,
          ),

          //course button
          //when device is mobile then hover effect is not showing otherwise show hover effect
          isMobile(context)
              ? OutlineButton(
                  hoverColor: themeprovider.isDarkMode
                      ? index_color.withOpacity(0.2)
                      : light_index_color.withOpacity(0.2),
                  borderSide: BorderSide(
                      color: themeprovider.isDarkMode
                          ? index_color
                          : light_index_color),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Text(
                      home_button,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: themeprovider.isDarkMode
                              ? index_color
                              : light_index_color),
                    ),
                  ),
                  onPressed: () {
                    launchCourse();
                  })
              : HoverUp(
                  child: OutlineButton(
                      hoverColor: themeprovider.isDarkMode
                          ? index_color.withOpacity(0.2)
                          : light_index_color.withOpacity(0.2),
                      borderSide: BorderSide(
                          color: themeprovider.isDarkMode
                              ? index_color
                              : light_index_color),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        child: Text(
                          home_button,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: themeprovider.isDarkMode
                                  ? index_color
                                  : light_index_color),
                        ),
                      ),
                      onPressed: () {
                        launchCourse();
                      }),
                ),

          //for some space
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }

  Future launchCourse() async {
    await launch(course_url);
  }

  //to launch upStatement of homepage
  Future launchUpstatement() async {
    await launch(upStatement_url);
  }
}

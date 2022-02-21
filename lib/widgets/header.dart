import 'package:client_portfolio/constraints/colors.dart';
import 'package:client_portfolio/constraints/strings.dart';
import 'package:client_portfolio/providers/themeProvider.dart';
import 'package:client_portfolio/widgets/light_Dark_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constraints/responsive.dart';
import 'navbar/navItem.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeprovider=Provider.of<ThemeProvider>(context);
    final logo_=themeprovider.isDarkMode? dark_mode_logo:light_mode_logo;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[

            //here is my header app logo
            Expanded(
              flex: 1,
              child: isMobile(context)?
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  logo_,
                  width: 50,
                  height: 50,
                ),
              )
                  :
              Image.asset(
                logo_,
                width: 50,
                height: 50,
              ),
            ),

            //when device is tab or desktop then the nav menu item is show
            if (!isMobile(context))
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.only(right: isTab(context)?30:60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Light_Dark_Mode(),   //to change light&dark mode i use it
                      // NavItem(
                      //   index: home_index,
                      //   title: home_,
                      //   itemIndex: 0,
                      // ),
                      NavItem(
                        index: about_index,
                        title: about_,
                        itemIndex: 1,
                      ),
                      NavItem(
                        index: experience_index,
                        title: experience_,
                        itemIndex: 2,
                      ),
                      NavItem(
                        index: work_index,
                        title: work_,
                        itemIndex: 3,
                      ),
                      NavItem(
                        index: contact_index,
                        title: contact_,
                        itemIndex: 4,
                      ),
                      SizedBox(width: 8,),
                      OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                        ),
                          hoverColor: themeprovider.isDarkMode? index_color.withOpacity(0.2): light_index_color.withOpacity(0.2),
                          borderSide: BorderSide(
                              color: themeprovider.isDarkMode ? index_color : light_index_color,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Text(
                              'Resume',
                              style: TextStyle(
                                  fontSize: isMobile(context)?14:isTab(context)?12:14,
                                  color: themeprovider.isDarkMode
                                      ? index_color
                                      : light_index_color),
                            ),
                          ),
                          onPressed: () {
                            launchResume();
                          }
                      ),
                    ],
                  ),
                ),
              ),

            //when device is mobile then the menu icon button is show
            if (isMobile(context))
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        icon: Icon(Icons.menu,color: themeprovider.isDarkMode?index_color:navy_color,),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        }
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future launchResume()async{
    await launch('https://brittanychiang.com/resume.pdf');
  }
}
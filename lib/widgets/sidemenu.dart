import 'package:client_portfolio/constraints/colors.dart';
import 'package:client_portfolio/providers/themeProvider.dart';
import 'package:client_portfolio/widgets/light_Dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constraints/responsive.dart';
import '../constraints/strings.dart';
import 'navbar/navItem.dart';

//to show the menu item only for mobile screen
class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //to change the bg color side menu we call themeProvider and set color on it's mode based
    final themeprovider = Provider.of<ThemeProvider>(context);
    final bg_color = themeprovider.isDarkMode ? navy_color : myWhite;

    return Container(
      height: double.infinity,
      color: bg_color,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //here all the nav item of side menu

              // NavItem(
              //   index: home_index + "\n",
              //   title: home_,
              //   itemIndex: 0,
              // ),
              //const SizedBox(height: 10),
              NavItem(
                index: about_index + "\n",
                title: about_,
                itemIndex: 1,
              ),
              const SizedBox(height: 10),
              NavItem(
                index: experience_index + "\n",
                title: experience_,
                itemIndex: 2,
              ),
              const SizedBox(height: 10),
              NavItem(
                index: work_index + "\n",
                title: work_,
                itemIndex: 3,
              ),
              const SizedBox(height: 10),
              NavItem(
                index: contact_index + "\n",
                title: contact_,
                itemIndex: 4,
              ),

              SizedBox(height: 10,),
              OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                  ),
                  hoverColor: themeprovider.isDarkMode? index_color.withOpacity(0.2) : light_index_color.withOpacity(0.2),
                  borderSide: BorderSide(
                    color: themeprovider.isDarkMode? index_color : light_index_color,),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      'Resume',
                      style: TextStyle(
                          fontSize: isMobile(context) ? 14 : isTab(context) ? 12 : 14,
                          color: themeprovider.isDarkMode? index_color : light_index_color
                      ),
                    ),
                  ),
                  onPressed: () {
                    launchResume();
                  }),

              const SizedBox(height: 30),

              //to show the light&dark mode button and close button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: themeprovider.isDarkMode? light_navy_color : lightest_salate_color,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(child: Light_Dark_Mode())
                  ),
                  SizedBox(width: 12,),
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: themeprovider.isDarkMode ? light_navy_color : lightest_salate_color,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                          child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                          )
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future launchResume()async{
    await launch('https://brittanychiang.com/resume.pdf');
  }
}

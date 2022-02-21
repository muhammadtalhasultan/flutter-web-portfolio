import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_portfolio/constraints/responsive.dart';
import 'package:client_portfolio/constraints/strings.dart';
import 'package:client_portfolio/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constraints/colors.dart';
import '../../../providers/themeProvider.dart';


class ContactSection extends StatelessWidget {
  ContactSection({Key? key}) : super(key: key);

  late Color linkColor;
  late Color title_color;
  late Color desColor;
  late Color hoberImageColor;

  @override
  Widget build(BuildContext context) {

    //change title and link color light and dark mode
    final themeProvider = Provider.of<ThemeProvider>(context);
    linkColor = themeProvider.isDarkMode ? index_color : light_index_color;
    title_color = themeProvider.isDarkMode ? lightest_salate_color : navy_color;
    desColor = themeProvider.isDarkMode ? salate_color : light_navy_color;
    hoberImageColor = themeProvider.isDarkMode ? index_color : light_navy_color;
    
    return isMobile(context)?
    contactBody(context)
        :
    Row(children: [
      Expanded(flex: 1,child: Center()),
      Expanded(flex: 4,child: contactBody(context)),
      Expanded(flex: 1,child: Center()),
      ],
    );
  }

  Widget contactBody(BuildContext context){
    double titleFontSize=isMobile(context)?36:isTab(context)?42:52;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          RichText(text: TextSpan(
              style: TextStyle(color: linkColor),
              children: [
                TextSpan(text: contact_index),
                TextSpan(text: contactIndexTitle),
              ]
            )
          ),
          SizedBox(height: 16,),
          Text(contact_title,style: TextStyle(fontSize: titleFontSize,color: title_color,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),

          SizedBox(height: 16,),
          AutoSizeText(contact_des,style: TextStyle(color: desColor,),textAlign: TextAlign.center,),
          SizedBox(height: 50,),
          helloButton(context),

          SizedBox(height: 200,), //give a space from bottom



          FooterSection(),       //here i show a footer
        ],
      ),
    );
  }

  Widget helloButton(BuildContext context){
    return Center(
        child: OutlineButton(
            borderSide: BorderSide(color: linkColor),
            hoverColor: linkColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            onPressed: (){
              launchUrl(contact_url);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 16),
              child: Text(contact_buttonName,style: TextStyle(color: linkColor,fontSize: 18,fontWeight: FontWeight.w400),),
            )
        )
    );
  }

  //to launch url
  Future launchUrl(String url) async {
    await launch(url);
  }

}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_portfolio/constraints/colors.dart';
import 'package:client_portfolio/constraints/responsive.dart';
import 'package:client_portfolio/constraints/strings.dart';
import 'package:client_portfolio/providers/themeProvider.dart';
import 'package:client_portfolio/widgets/hoverItem.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatefulWidget {
   AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  late Color linkColor;

  late Color title_color;

  late Color desColor;

  late Color hoberImageColor;

  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    linkColor=themeProvider.isDarkMode?index_color:light_index_color;
    title_color=themeProvider.isDarkMode?lightest_salate_color:navy_color;
    desColor=themeProvider.isDarkMode?salate_color:light_navy_color;
    hoberImageColor=themeProvider.isDarkMode?index_color:dark_navy_color;
    return Padding(
      padding: isTab(context)?EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 200):EdgeInsets.only(top: 30,left: 30,right: 30,bottom: 200),
      child: isMobile(context)?
      Column(
        children: [
          text_about(context),
          SizedBox(height: 60),
          image_about(context),
        ],
      )
          :
      Row(
        children: [
          Expanded(child: text_about(context)),
          SizedBox(width: 30,),
          image_about(context),
        ],
      ),
    );
  }

  Widget text_about(BuildContext context){
    return Column(
      children: [
        heading_about(context),
        description_about(),
      ],
    );
  }

  Widget description_about(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        Text(about_me_des1,style: TextStyle(color: desColor,fontSize: 16),),
        SizedBox(height: 30,),
        RichText(text: TextSpan(
          style: TextStyle(fontSize: 16),
          children: [
            TextSpan(text: about_me_des2,style: TextStyle(color: desColor)),
            TextSpan(text: about_me_des2_link1,style: TextStyle(color: linkColor),recognizer: TapGestureRecognizer()..onTap=launchAdvertising),
            TextSpan(text: about_me_des2_link2,style: TextStyle(color: linkColor),recognizer: TapGestureRecognizer()..onTap=launchStartUp),
            TextSpan(text: about_me_des2_link3,style: TextStyle(color: linkColor),recognizer: TapGestureRecognizer()..onTap=launchCorporation),
            TextSpan(text: about_me_des3,style: TextStyle(color: desColor)),
            TextSpan(text: about_me_des3_link,style: TextStyle(color: linkColor),recognizer: TapGestureRecognizer()..onTap=launchDesignStudio),
            TextSpan(text: about_me_des4,style: TextStyle(color: desColor)),
            TextSpan(text: about_me_des4_link,style: TextStyle(color: linkColor),recognizer: TapGestureRecognizer()..onTap=launchUpstatement),
            TextSpan(text: about_me_des5,style: TextStyle(color: desColor)),
          ]
        )),
        SizedBox(height: 30,),
        RichText(text: TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(text: about_me_des6,style: TextStyle(color: desColor)),
              TextSpan(text: about_me_des6_link,style: TextStyle(color: linkColor),recognizer: TapGestureRecognizer()..onTap=launchLaunchedCourse),
              TextSpan(text: about_me_des62,style: TextStyle(color: desColor)),
            ]
        )),

        SizedBox(height: 30,),
        Text(about_me_des7,style: TextStyle(fontSize: 16,color: desColor),),
        SizedBox(height: 20,),

        //all working technology
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createTechnology(about_me_technology1),
                  createTechnology(about_me_technology2),
                  createTechnology(about_me_technology3),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createTechnology(about_me_technology4),
                  createTechnology(about_me_technology5),
                  createTechnology(about_me_technology6),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget createTechnology(String tech){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.play_arrow,color: linkColor,size: 12,),
          Expanded(child: AutoSizeText(tech,style: TextStyle(color: desColor),maxLines: 2)),
        ],
      ),
    );
  }

  Widget heading_about(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(about_index,style: TextStyle(color: linkColor,fontSize: isMobile(context)?18:32),),
        AutoSizeText(about_me_title,style: TextStyle(color: title_color,fontSize: isMobile(context)?26:isTab(context)?30:36,fontWeight: FontWeight.w700),),
        SizedBox(width: 12,),
        Expanded(
          child: Divider(),
        )
      ],
    );
  }

  Widget image_about(BuildContext context){
    double top_margin=0;
    double left_margin=0;

    //when device is tab then image size should be 200
    double container_size=isTab(context)?200:300;
    return HoverItem(
      builder: (isHovered){
        //to control image and other container design
        if(isTab(context)){
          top_margin=isHovered?-5:-10;
          left_margin=isHovered?-5:-10;
        }
        else{
          top_margin=isHovered?-15:-25;
          left_margin=isHovered?-15:-25;
        }

        return Stack(
          clipBehavior: Clip.none, fit: StackFit.passthrough,
          children: [
            Positioned(
              bottom: top_margin,
              right: left_margin,
              child: Container(
                height: container_size,
                width: container_size,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2,color: linkColor)
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ShaderMask(
                shaderCallback: (mask){
                  return LinearGradient(
                      colors: [
                        isHovered?Colors.transparent:hoberImageColor.withOpacity(0.7),
                        isHovered?Colors.transparent:hoberImageColor.withOpacity(0.7)
                      ],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)
                      .createShader(mask);
                },
                blendMode: BlendMode.darken,
                child: Container(
                  height: container_size,
                  width: container_size,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage('assets/picture.JPEG'),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //to launch all url
   Future launchAdvertising()async{
    await launch(advertising_url);
  }

   Future launchStartUp()async{
     await launch(startUP_url);
   }

   Future launchCorporation()async{
     await launch(corporation_url);
   }

   Future launchDesignStudio()async{
     await launch(designStudio_url);
   }

   Future launchLaunchedCourse()async{
     await launch(launchedCourse_url);
   }

   Future launchUpstatement()async{
     await launch(upStatement_url);
   }
}

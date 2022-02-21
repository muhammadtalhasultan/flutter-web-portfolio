import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constraints/colors.dart';
import '../../../constraints/responsive.dart';
import '../../../constraints/strings.dart';
import '../../../providers/themeProvider.dart';
import 'experience1.dart';
import 'experience2.dart';
import 'experience3.dart';
import 'experience4.dart';
import 'experience5.dart';
import 'experience6.dart';

class ExperienceSection extends StatefulWidget {
  ExperienceSection({Key? key}) : super(key: key);

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {

  late Color linkColor;
  late Color title_color;
  late Color desColor;
  late Color hoberImageColor;


  //to control page I take a index and below I created a list of all experience page
  var index=0;
  final pages=[
    Experience1(),
    Experience2(),
    Experience3(),
    Experience4(),
    Experience5(),
    Experience6(),
  ];

  //when mobile screen found then experience item show by tab so that I initial a tab and its item
  List<Tab> tabs=[
    Tab(child: Text(experience_list[0],style: TextStyle(color: light_index_color),),),
    Tab(child: Text(experience_list[1],style: TextStyle(color: light_index_color),),),
    Tab(child: Text(experience_list[2],style: TextStyle(color: light_index_color),),),
    Tab(child: Text(experience_list[3],style: TextStyle(color: light_index_color),),),
    Tab(child: Text(experience_list[4],style: TextStyle(color: light_index_color),),),
    Tab(child: Text(experience_list[5],style: TextStyle(color: light_index_color),),),
  ];

  @override
  Widget build(BuildContext context) {
    //change title and link color light and dark mode

    final themeProvider=Provider.of<ThemeProvider>(context);
    linkColor=themeProvider.isDarkMode?index_color:light_index_color;
    title_color=themeProvider.isDarkMode?lightest_salate_color:navy_color;
    desColor=themeProvider.isDarkMode?salate_color:light_navy_color;       //description color

    return Padding(
      padding: isTab(context)?EdgeInsets.all(10):EdgeInsets.all(30),
      child: isDesktop(context)?
      Row(
        children: [
          Expanded(flex: 1,child: Center()),
          Expanded(flex: 5,child: experience()),    //in desktop mode I want to show experience in the middle
          Expanded(flex: 1,child: Center()),
        ],
      )
          :
      experience(),
    );
  }

  Widget experience(){
    return Column(
      children: [
        //to show the heading
        heading_experience(context),
        SizedBox(height: 30,),

        isMobile(context)?description_mobile():description_desktop(),

        SizedBox(height: 200,),
      ],
    );
  }

  //to show the title of section
  Widget heading_experience(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(experience_index,style: TextStyle(color: linkColor,fontSize: isMobile(context)?18:26),),
        AutoSizeText(experience_title,style: TextStyle(color: title_color,fontSize: isMobile(context)?22:32,fontWeight: FontWeight.w700),),
        SizedBox(width: 12,),
        Expanded(
          child: Divider(),
        )
      ],
    );
  }

  //only for desktop
  Widget description_desktop(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            build_item(0),
            build_item(1),
            build_item(2),
            build_item(3),
            build_item(4),
            build_item(5),
          ],
        ),
        SizedBox(width: 16),
        Expanded(child: pages[index])
      ],
    );
  }


  Widget description_mobile(){
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length: tabs.length,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                  isScrollable: true,
                  indicatorColor: light_index_color,
                  tabs: tabs
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              height: MediaQuery.of(context).size.height-80,
              child: TabBarView(
                  children: pages
              ),
            )
          ],
        ),
      ),
    );
  }

  //only for desktop and tab i create this item widget
  Widget build_item(int index_){
    double font_size=index_==index? 16: 15;
    final txt_color=index_==index? linkColor: desColor;
    return InkWell(
      onTap: (){
        setState(() {
          this.index=index_;
        });
      },
      child: Container(
        height: 40,
          width: 120,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(experience_list[index_],style: TextStyle(color: txt_color,fontSize: font_size),),
              ))
      ),
    );
  }


}
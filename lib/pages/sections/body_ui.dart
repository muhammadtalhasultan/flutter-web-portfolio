import 'package:client_portfolio/constraints/responsive.dart';
import 'package:client_portfolio/pages/sections/projects/project_section.dart';
import 'package:client_portfolio/pages/sections/rightSection_body.dart';
import 'package:client_portfolio/widgets/showAnimtion.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../services/ChangePage.dart';
import 'about/about_section.dart';
import 'contact/contact_section.dart';
import 'experience/experience_section.dart';
import 'home/Home.dart';
import 'leftSection_body.dart';

class Body_ui extends StatefulWidget {
  Body_ui({Key? key}) : super(key: key);

  @override
  State<Body_ui> createState() => _Body_uiState();

}


class _Body_uiState extends State<Body_ui> {


  //create a list of all sections of homepage
  final page=[
    HomePage(),
    AboutSection(),
    ExperienceSection(),
    ProjectSection(),
    ContactSection(),
  ];

  //to listen current page
  ItemPositionsListener itemPositionsListener=ItemPositionsListener.create();


  //you can ignore initState because here Show the index of section which i scroll or visible
  @override
  void initState() {
    super.initState();

    //to see pages which are currently visible
    itemPositionsListener.itemPositions.addListener(() {
      final indices=itemPositionsListener.itemPositions.value
      //     .where((element){
      //       final isTopVisible=element.itemLeadingEdge >= 0;
      //       final isBottomVisible=element.itemTrailingEdge<=1;
      //
      //       return isTopVisible && isBottomVisible;
      // })
          .map((page_) => page_.index).toList();

      print(indices.last);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isMobile(context)?
      //for mobile
      SectionMiddle():

      //for tab & desktop
      Row(
        children: [
          Expanded(
            flex: 1,
            child: ShowAnimation(child: SectionLeft()),
          ),
          Expanded(
            flex: 5,
            child: SectionMiddle(),
          ),
          Expanded(
            flex: 1,
            child: ShowAnimation(child: SectionRight()),
          ),
        ],
      ),
    );
  }

  Widget SectionMiddle(){
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false), //to hide scrollbar
      child: ScrollablePositionedList.builder(
        itemCount: page.length,
        itemBuilder: (context,index){
          return Container(
            child: ShowAnimation(child: page[index],),
          );
        },
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
      ),
    );
  }


}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_portfolio/constraints/responsive.dart';
import 'package:client_portfolio/constraints/strings.dart';
import 'package:client_portfolio/widgets/hoverItem.dart';
import 'package:client_portfolio/widgets/showAnimtion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constraints/colors.dart';
import '../../../providers/themeProvider.dart';
import '../../../widgets/socialMediaIcon/SocialMediaIcon.dart';
import '../leftSection_body.dart';
import '../rightSection_body.dart';
import 'archive_data.dart';

class ArchiveSection extends StatefulWidget {
  ArchiveSection({Key? key}) : super(key: key);

  @override
  State<ArchiveSection> createState() => _ArchiveSectionState();
}

class _ArchiveSectionState extends State<ArchiveSection> {
  late Color linkColor;
  late Color title_color;
  late Color desColor;
  late Color hoberIconColor;

  List<Widget> _archiveTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _addArchive();
    });
  }

  void _addArchive() {
    // get data from db
    Future ft=Future((){});
    archiveList.forEach((Archive archive) {
      ft=ft.then((value){
        return Future.delayed(Duration(milliseconds: 200),(){
          _archiveTiles.add(archiveListItem(context , archive ));
          _listKey.currentState!.insertItem(_archiveTiles.length-1);
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    //change title and link color light and dark mode
    final themeProvider = Provider.of<ThemeProvider>(context);
    linkColor = themeProvider.isDarkMode ? index_color : light_index_color;
    title_color = themeProvider.isDarkMode ? lightest_salate_color : navy_color;
    desColor = themeProvider.isDarkMode ? salate_color : light_navy_color;
    hoberIconColor = themeProvider.isDarkMode ? salate_color : light_navy_color;


    return Scaffold(
      body: Column(
        children: [
          archive_header(context),
          SizedBox(height: 30,),
          Expanded(
            child: isMobile(context)? createArchiveList(context):Row(
              children: [
                Expanded(flex: 1,child: ShowAnimation(child: SectionLeft())),
                Expanded(flex: 5,child: createArchiveList(context)),
                Expanded(flex: 1,child: ShowAnimation(child: SectionRight())),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget archive_header(BuildContext context){
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          SizedBox(width: 16,),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_rounded)),
          SizedBox(width: 16,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Archive',style: TextStyle(fontWeight: FontWeight.bold,color: title_color, fontSize: isMobile(context)?32:isTab(context)?42:52),),
              AutoSizeText('A big list of things I’ve worked on',style: TextStyle(color: linkColor),),
            ],
          ),
        ],
      ),
    );
  }

  Widget createArchiveList(BuildContext context){
    Tween<Offset> _offset=Tween(begin: Offset(1, 0),end: Offset(0, 0));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 16),
      child: Column(
        children: [
          archiveList_header(context),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false), //to hide scrollbar
              child: AnimatedList(
                  key: _listKey,
                  initialItemCount: _archiveTiles.length,
                  itemBuilder: (context, index,animation) {
                    return SlideTransition(
                      child: _archiveTiles[index],
                      position: animation.drive(_offset),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget archiveList_header(BuildContext context){
    final textStyle=TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: desColor);
    return isMobile(context)? Row(
      children: [
        Expanded(flex: 1,child: Text('Year',style: textStyle,)),
        Expanded(flex: 2,child: Text('Title',style: textStyle,)),
        SizedBox(width: 5,),
        Text('Link',style: textStyle,),
      ],
    ): Row(
      children: [
        Expanded(flex: 1,child: Text('Year',style: textStyle,)),
        Expanded(flex: 2,child: Text('Title',style: textStyle,)),
        SizedBox(width: 5,),
        Expanded(flex: 1,child: AutoSizeText('Made at',style: textStyle,maxLines: 1,)),
        SizedBox(width: 5,),
        Expanded(flex: 2,child: AutoSizeText('Built with',style: textStyle,maxLines: 1,)),
        SizedBox(width: 5,),
        Expanded(flex: 1,child: Text('Link',style: textStyle,)),
      ],
    );
  }

  Widget archiveListItem(BuildContext context,Archive archive){
    return isMobile(context)?
    Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1,child: Text(archive.year,style: TextStyle(color: linkColor,fontSize: 16,),)),
          Expanded(flex: 2,child: AutoSizeText(archive.title,style: TextStyle(color: title_color,fontSize: 16,fontWeight: FontWeight.w700),)),
          SizedBox(width: 5,),
          HoverItem(builder: (isHovered){
            final iconColor=isHovered?linkColor:desColor;
            return
                GestureDetector(
                  onTap: ()=>launchUrl(archive.link),
                  child: FaIcon(
                    FontAwesomeIcons.externalLinkAlt,
                    size: 16,
                    color: iconColor,
            ),
                );
          }),
        ],
      ),
    ):

    Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(flex: 1,child: Text(archive.year,style: TextStyle(color: linkColor,fontSize: 16,),)),
          Expanded(flex: 2,child: AutoSizeText(archive.title,style: TextStyle(color: title_color,fontSize: 16,fontWeight: FontWeight.w700),)),
          SizedBox(width: 5,),
          Expanded(flex: 1,child: AutoSizeText(archive.made_at,style: TextStyle(color: desColor,fontSize: 15,fontWeight: FontWeight.w500),maxLines: 1,)),
          Expanded(flex: 2,child: AutoSizeText(archive.built_with,style: TextStyle(color: desColor,fontSize: 15,fontWeight: FontWeight.w500),)),
          SizedBox(width: 5,),
          Expanded(
              flex: 1,
              child: HoverItem(builder: (isHovered){
                final iconColor=isHovered?index_color:hoberIconColor;
                return
                  GestureDetector(
                    onTap: ()=>launchUrl(archive.link),
                    child: FaIcon(
                      FontAwesomeIcons.externalLinkAlt,
                      size: 16,
                      color: iconColor,
                    ),
                  );
              })
          ),
        ],
      ),
    );
  }

  //to launch archive url
  Future launchUrl(String url) async {
    await launch(url);
  }
}

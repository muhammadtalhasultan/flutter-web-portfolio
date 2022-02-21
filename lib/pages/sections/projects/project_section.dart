import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_portfolio/constraints/strings.dart';
import 'package:client_portfolio/pages/sections/projects/project_Data.dart';
import 'package:client_portfolio/widgets/hoverUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constraints/colors.dart';
import '../../../constraints/responsive.dart';
import '../../../providers/themeProvider.dart';
import '../../../widgets/hoverItem.dart';
import '../archive/archive_section.dart';

class ProjectSection extends StatefulWidget {
  ProjectSection({Key? key}) : super(key: key);

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {

  late Color linkColor;
  late Color title_color;
  late Color desColor;
  late Color hoberImageColor;

  bool isClicked = false; //this variable for show and hide  projects

  @override
  Widget build(BuildContext context) {

    //change title and link color in light and dark mode
    final themeProvider = Provider.of<ThemeProvider>(context);
    linkColor = themeProvider.isDarkMode ? index_color : light_index_color;
    title_color = themeProvider.isDarkMode ? lightest_salate_color : navy_color;
    desColor = themeProvider.isDarkMode ? salate_color : light_navy_color;
    hoberImageColor = themeProvider.isDarkMode ? index_color : light_navy_color;

    return Padding(
      padding: isTab(context) ? EdgeInsets.all(10) : EdgeInsets.all(30),
      child: Column(
        children: [

          //built section start
          heading_experience(context),
          const SizedBox( height: 50, ),
          createBuiltItem1(context),
          const SizedBox( height: 80, ),
          createBuiltItem2(context),
          const SizedBox( height: 80, ),
          createBuiltItem3(context),
          //built section end

          SizedBox(height: 120,),

          //other noteworthy projects section start
          Center(
            child: Text(
              projectTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: title_color,
                  fontSize: isMobile(context) ? 28 : 36,
                  fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 12,),
          // view all archive button
          Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArchiveSection()
                        )
                    );
                  },
                  child: Text(
                    archive_buttonName,
                    style: TextStyle(
                        color: linkColor, fontWeight: FontWeight.w500),
                  )
              )
          ),
          const SizedBox( height: 30, ),
          //other noteworthy projects section end

          //to show all projects
          if (isMobile(context)) showProjects_mobile(context)
          else if(isTab(context)) showProjects_tab(context)
          else showProjects_desktop(context),

          const SizedBox( height: 16, ),

          //to show more projects
          isClicked?
          isMobile(context)?
          showMoreProjects_mobile(context)
                  :
          isTab(context)?
          showMoreProjects_tab(context)
                      :
          showMoreProjects_desktop(context)
              :
          const Center(),

          const SizedBox( height: 80, ),
          hide_showButton(context),

          const SizedBox( height: 200, ), //to separate from contact section
        ],
      ),
    );
  }

  Widget hide_showButton(BuildContext context) {
    return Center(
        child: OutlineButton(
            borderSide: BorderSide(color: linkColor),
            hoverColor: linkColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onPressed: () {
              setState(() {
                isClicked = !isClicked;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: Text(
                isClicked ? showLessButton_name : showMoreButton_name,
                style: TextStyle(
                    color: linkColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            )
        )
    );
  }

  Widget createBuiltItem1(BuildContext context) {
    return isMobile(context) ?
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              image_builtItem(context, "assets/ss1.png"),
              Positioned(
                  child: description_builtItem(
                      context,
                      builtItem1_name,
                      builtItem1_des,
                      builtItem1_uses_platform,
                      builtItem1_url,
                      builtItem1Git,
                      builtItem1ExtraLink))
            ],
          ),
        )
          :
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 10, child: image_builtItem(context, "assets/ss1.png")),
            description_builtItem(
                context,
                builtItem1_name,
                builtItem1_des,
                builtItem1_uses_platform,
                builtItem1_url,
                builtItem1Git,
                builtItem1ExtraLink)
          ],
        );


        //only for tab and desktop

  }

  Widget createBuiltItem2(BuildContext context) {
    return isMobile(context)
        ? Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                image_builtItem(context, "assets/ss2.png"),
                Positioned(
                    child: description_builtItem(
                        context,
                        builtItem2_name,
                        builtItem2_des,
                        builtItem2_uses_platform,
                        builtItem2_url,
                        builtItem2Git,
                        builtItem2ExtraLink))
              ],
            ),
          )

        //if device is tab or desktop
        : Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  right: 10, child: image_builtItem(context, "assets/ss2.png")),
              oposite_description_builtItem(
                  context,
                  builtItem2_name,
                  builtItem2_des,
                  builtItem2_uses_platform,
                  builtItem2_url,
                  builtItem2Git,
                  builtItem2ExtraLink),
            ],
          );
  }

  Widget createBuiltItem3(BuildContext context) {
    return isMobile(context)
        ? Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                image_builtItem(context, "assets/ss3.png"),
                Positioned(
                    child: description_builtItem(
                        context,
                        builtItem3_name,
                        "${builtItem3_des1 + '\n\n' + builtItem3_des2}",
                        builtItem3_uses_platform,
                        builtItem3_url,
                        builtItem3Git,
                        builtItem3ExtraLink))
              ],
            ),
          )

        //if device is tab or desktop
        : Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  left: 10, child: image_builtItem(context, "assets/ss3.png")),
              description_builtItem(
                  context,
                  builtItem3_name,
                  "${builtItem3_des1 + '\n\n' + builtItem3_des2}",
                  builtItem3_uses_platform,
                  builtItem3_url,
                  builtItem3Git,
                  builtItem3ExtraLink)
            ],
          );
  }

  //to show the title of the section
  Widget heading_experience(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          work_index,
          style: TextStyle(
              color: linkColor, fontSize: isMobile(context) ? 18 : 26),
        ),
        AutoSizeText(
          built_headerTitle,
          style: TextStyle(
              color: title_color,
              fontSize: isMobile(context) ? 22 : 32,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Divider(),
        )
      ],
    );
  }

  Widget description_builtItem(
      BuildContext context,
      String itemName,
      String des,
      String platform,
      String itemUrl,
      String gitLink,
      String extraLink) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment:
            isMobile(context) ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: isMobile(context)
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            builtItem_heading,
            style: TextStyle(color: linkColor, fontSize: 15),
          ),
          SizedBox(
            height: 8,
          ),
          HoverItem(builder: (isHovered) {
            final color = isHovered ? linkColor : title_color;
            return AutoSizeText(
              itemName,
              style: TextStyle(
                  color: color, fontSize: 32, fontWeight: FontWeight.w800),
            );
          }),

          SizedBox(
            height: 16,
          ),
          //here is built item description
          isMobile(context)
              ? AutoSizeText(
                  des,
                  maxLines: 6,
                  style: TextStyle(color: desColor, fontSize: 16),
                  textAlign:
                      isMobile(context) ? TextAlign.start : TextAlign.end,
                )
              : Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 25, bottom: 25),
                      child: AutoSizeText(
                        des,
                        style: TextStyle(color: desColor, fontSize: 16),
                        textAlign:
                            isMobile(context) ? TextAlign.start : TextAlign.end,
                        maxLines: isTab(context) ? 6 : 10,
                      ),
                    ),
                  ),
                ),

          SizedBox(
            height: 16,
          ),
          //here is built item uses platform
          AutoSizeText(
            platform,
            style: TextStyle(color: desColor),
            textAlign: isMobile(context) ? TextAlign.start : TextAlign.end,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: isMobile(context)
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            crossAxisAlignment: isMobile(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    launchUrl(gitLink);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.github,
                    size: 20,
                  )),
              SizedBox(
                width: 16,
              ),
              IconButton(
                  onPressed: () {
                    launchUrl(extraLink);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.externalLinkAlt,
                    size: 20,
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget oposite_description_builtItem(
      BuildContext context,
      String itemName,
      String des,
      String platform,
      String itemUrl,
      String gitLink,
      String extraLink) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            builtItem_heading,
            style: TextStyle(color: linkColor, fontSize: 15),
          ),
          SizedBox(
            height: 8,
          ),
          HoverItem(builder: (isHovered) {
            final color = isHovered ? linkColor : title_color;
            return AutoSizeText(
              itemName,
              style: TextStyle(
                  color: color, fontSize: 32, fontWeight: FontWeight.w800),
            );
          }),

          SizedBox(height: 16,),
          //here is built item description
          isMobile(context) ?
          AutoSizeText(
            des,
            style: TextStyle(color: desColor, fontSize: 16),
            textAlign: TextAlign.start,
          )
              :
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: 25, bottom: 25),
                child: AutoSizeText(
                  des,
                  style: TextStyle(color: desColor, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),

          SizedBox(height: 16,),
          //here is built item uses platform
          AutoSizeText(
            platform,
            style: TextStyle(color: desColor),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    launchUrl(gitLink);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.github,
                    size: 20,
                  )
              ),
              SizedBox(width: 16,),
              IconButton(
                  onPressed: () {
                    launchUrl(extraLink);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.externalLinkAlt,
                    size: 20,
                  )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget image_builtItem(BuildContext context, String img) {
    final size = MediaQuery.of(context).size;
    //when device is tab then image size should be 200
    double container_height = isTab(context) ? 250 : 350;
    double container_width = isMobile(context) ? size.width : size.width / 3;

    return HoverItem(
      builder: (isHovered) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: isMobile(context)?
              Container(
                height: container_height,
                width: container_width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      opacity: 0.1,
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    )),
              )
                  :
              ShaderMask(
                shaderCallback: (mask) {
                  return LinearGradient(
                      colors: [
                        isHovered? Colors.transparent: hoberImageColor.withOpacity(0.9),
                        isHovered? Colors.transparent: hoberImageColor.withOpacity(0.9)
                      ],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter
                  ).createShader(mask);

                },
                blendMode: BlendMode.darken,
                child: Container(
                  height: container_height,
                  width: container_width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
              ),
        );
      },
    );
  }

  //here i created all the projects
  Widget showProjects_desktop(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: singleProject(allProjects[0])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(allProjects[1])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(allProjects[2])),
          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: singleProject(allProjects[3])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(allProjects[4])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(allProjects[5])),
          ],
        )
      ],
    );
  }

  Widget showProjects_tab(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: singleProject(allProjects[0])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(allProjects[1])),
          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: singleProject(allProjects[2])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(allProjects[3])),
          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: singleProject(allProjects[4])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(allProjects[5])),
          ],
        ),
      ],
    );
  }

  Widget showProjects_mobile(BuildContext context) {
    return Column(
      children: [
        singleProject(allProjects[0]),
        SizedBox(height: 16,),
        singleProject(allProjects[1]),
        SizedBox(height: 16,),
        singleProject(allProjects[2]),
        SizedBox(height: 16,),
        singleProject(allProjects[3]),
        SizedBox(height: 16,),
        singleProject(allProjects[4]),
        SizedBox(height: 16,),
        singleProject(allProjects[5]),
      ],
    );
  }

  //to show more projects
  Widget showMoreProjects_desktop(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: singleProject(moreProjects[0])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(moreProjects[1])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(moreProjects[2])),
          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: singleProject(moreProjects[3])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(moreProjects[4])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(moreProjects[5])),
          ],
        )
      ],
    );
  }

  Widget showMoreProjects_tab(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: singleProject(moreProjects[0])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(moreProjects[1])),
          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: singleProject(moreProjects[2])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(moreProjects[3])),
          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            Expanded(child: singleProject(moreProjects[4])),
            SizedBox(width: 16,),
            Expanded(child: singleProject(moreProjects[5])),
          ],
        ),
      ],
    );
  }

  Widget showMoreProjects_mobile(BuildContext context) {
    return Column(
      children: [
        singleProject(moreProjects[0]),
        SizedBox(height: 16,),
        singleProject(moreProjects[1]),
        SizedBox(height: 16,),
        singleProject(moreProjects[2]),
        SizedBox(height: 16,),
        singleProject(moreProjects[3]),
        SizedBox(height: 16,),
        singleProject(moreProjects[4]),
        SizedBox(height: 16,),
        singleProject(moreProjects[5]),
      ],
    );
  }

  //here i create a single grid item that means single projects widget
  //if the device is mobile then don't show any hover effect otherwise show hoverup
  Widget singleProject(Project project) {
    return isMobile(context)?
        Card(
          elevation: 2,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              launchUrl(project.url);
            },
            child: SizedBox(
              height: 380,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.folder_outlined,
                              size: 30,
                              color: linkColor,
                            ),
                            onPressed: () => launchUrl(project.url),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () => launchUrl(project.extraUrl),
                            icon: FaIcon(
                              FontAwesomeIcons.externalLinkAlt,
                              size: 14,
                              color: linkColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    Expanded(
                        flex: 1,
                        child: AutoSizeText(
                          project.name,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: title_color),
                        )
                    ),
                    Expanded(
                        flex: 2,
                        child: AutoSizeText(
                          project.des,
                          style: TextStyle(color: desColor),
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: AutoSizeText(
                          project.platform,
                          style: TextStyle(color: title_color),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
            :
        HoverUp(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                launchUrl(project.url);
              },
              child: SizedBox(
                height: 380,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.folder_outlined,
                                size: 30,
                                color: linkColor,
                              ),
                              onPressed: () => launchUrl(project.url),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () => launchUrl(project.extraUrl),
                              icon: FaIcon(
                                FontAwesomeIcons.externalLinkAlt,
                                size: 14,
                                color: linkColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            project.name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: title_color),
                          )
                      ),
                      Expanded(
                          flex: 2,
                          child: AutoSizeText(
                            project.des,
                            style: TextStyle(color: desColor),
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            project.platform,
                            style: TextStyle(color: title_color),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }

  //to launch upStatement of homepage
  Future launchUrl(String url) async {
    await launch(url);
  }
}

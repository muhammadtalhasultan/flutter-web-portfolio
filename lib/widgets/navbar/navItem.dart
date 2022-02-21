import 'package:client_portfolio/constraints/colors.dart';
import 'package:client_portfolio/constraints/responsive.dart';
import 'package:client_portfolio/providers/themeProvider.dart';
import 'package:client_portfolio/services/ChangePage.dart';
import 'package:client_portfolio/widgets/hoverScale.dart';
import 'package:client_portfolio/widgets/hoverUp.dart';
import 'package:client_portfolio/widgets/hoverItem.dart';
import 'package:client_portfolio/widgets/showAnimtion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavItem extends StatefulWidget {
  const NavItem({
    Key? key,
    required this.index,
    required this.title,
    required this.itemIndex,
  }) : super(key: key);

  final String index;
  final String title;
  final int itemIndex;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  late Color heading_index_color;
  late Color heading_title_color;

  @override
  Widget build(BuildContext context) {

    //here i pick color for section index and title
    final themeprovider = Provider.of<ThemeProvider>(context);
    heading_index_color = themeprovider.isDarkMode? index_color: light_index_color.withOpacity(0.9);
    heading_title_color = themeprovider.isDarkMode? myWhite: navy_color;

    //hoverScale for Scale nav item 1.1
    //hoverItem for show different color in item when I hover

    return HoverScale(
      child: HoverItem(
        builder: (isHovered){
          //when hover on item then change it's color
          final color=isHovered?heading_index_color:heading_title_color;
          return InkWell(
            onTap: () {
              scrollToItem(widget.itemIndex);
            },
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(fontSize: isMobile(context)?14:isTab(context)?12:14),
                      children: [
                    TextSpan(
                        text: widget.index,
                        style: TextStyle(color: heading_index_color)
                    ),
                    TextSpan(
                        text: widget.title,
                        style: TextStyle(
                          color: color,
                        )
                    ),
                  ]
                 )
              ),
            ),
          );
        },
      ),
    );
  }
}

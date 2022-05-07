import 'package:client_portfolio/constraints/responsive.dart';
import 'package:client_portfolio/constraints/strings.dart';
import 'package:client_portfolio/widgets/hoverItem.dart';
import 'package:client_portfolio/widgets/socialMediaIcon/SocialMediaIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../constraints/colors.dart';
import '../providers/themeProvider.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  late Color linkColor;

  late Color title_color;

  late Color desColor;

  late Color hoberImageColor;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    linkColor = themeProvider.isDarkMode ? index_color : light_index_color;
    desColor = themeProvider.isDarkMode ? salate_color : light_navy_color;

    //if device is mobile then show social media icons and footer text in bottom
    //otherwise only show the footer text

    return isMobile(context)
        ? Column(
            children: [
              showSocialMedia(context),
              SizedBox(
                height: 16,
              ),
              showFooter(),
            ],
          )
        : showFooter();
  }

  //only for mobile I show these social media icon
  Widget showSocialMedia(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //here all the social icon . it's show on the below of app
        socialMediaIcon(fb_url, FontAwesomeIcons.facebookF, context),
        SizedBox(
          width: 25,
        ),
        socialMediaIcon(github_url, FontAwesomeIcons.github, context),
        SizedBox(
          width: 25,
        ),
        socialMediaIcon(instagram_url, FontAwesomeIcons.instagram, context),
        SizedBox(
          width: 25,
        ),
        socialMediaIcon(twitter_url, FontAwesomeIcons.twitter, context),
        SizedBox(
          width: 25,
        ),
        socialMediaIcon(linkedin_url, FontAwesomeIcons.linkedin, context),
      ],
    );
  }

  Widget showFooter() {
    return HoverItem(
      builder: ((isHovered) {
        final hoverColor = isHovered ? linkColor : desColor;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              footerText,
              style: TextStyle(color: hoverColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_border_outlined,
                  size: 14,
                  color: hoverColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(footerStarNumber,
                    style: TextStyle(color: hoverColor, fontSize: 12)),
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.share,
                  size: 14,
                  color: hoverColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(footerShareNumber,
                    style: TextStyle(color: hoverColor, fontSize: 12)),
              ],
            ),

            SizedBox(
              height: 30,
            ), //to give some space
          ],
        );
      }),
    );
  }
}

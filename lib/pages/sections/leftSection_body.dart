import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constraints/strings.dart';
import '../../widgets/socialMediaIcon/SocialMediaIcon.dart';

class SectionLeft extends StatelessWidget {
  const SectionLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            socialMediaIcon(fb_url, FontAwesomeIcons.facebookF, context),
            const SizedBox(height: 25,),
            socialMediaIcon(github_url, FontAwesomeIcons.github, context),
            const SizedBox(
              height: 25,
            ),
            socialMediaIcon(instagram_url, FontAwesomeIcons.instagram, context),
            const SizedBox(
              height: 25,
            ),
            socialMediaIcon(twitter_url, FontAwesomeIcons.twitter, context),
            const SizedBox(
              height: 25,
            ),
            socialMediaIcon(linkedin_url, FontAwesomeIcons.linkedin, context),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              width: 2,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

//this section for show social icon in left of homepage

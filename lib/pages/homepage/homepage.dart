import 'package:flutter/material.dart';

import '../../widgets/header.dart';
import '../../widgets/sidemenu.dart';
import '../sections/body_ui.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints(minWidth: size.width / 2, maxWidth: size.width / 2),
        child: SideMenu(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Header(),
          Expanded(child: Body_ui()),
        ],
      ),
    );
  }
}



//in this homepage I create a column
//and there are 2 child
//1st: header for logo, nav item etc which I create widgets package
//2nd: body of home page which I create ui section

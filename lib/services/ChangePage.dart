import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

//In homepage I use a listview to show all the section.
//So that, I need to change the list item when I click nav Item
//to change , just I code here

final itemKey = GlobalKey();
ItemScrollController itemScrollController = ItemScrollController();

Future scrollToItem(int index_) async {
  itemScrollController.scrollTo(
    index: index_,
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut,
  );
}

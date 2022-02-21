import 'package:flutter/material.dart';

//it's used for change text color when I hover
class HoverItem extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  HoverItem({Key? key,required this.builder}) : super(key: key);

  @override
  _HoverItemState createState() => _HoverItemState();
}

class _HoverItemState extends State<HoverItem> {
  bool isHovered=false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event)=>onEntered(true),
      onExit: (event)=>onEntered(false),
      child: widget.builder(isHovered),
    );
  }

  void onEntered(bool isHovered){
    setState(() {
      this.isHovered=isHovered;
    });
  }
}

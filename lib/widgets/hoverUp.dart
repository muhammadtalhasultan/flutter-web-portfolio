import 'package:flutter/material.dart';

//to show item up when I hover

class HoverUp extends StatefulWidget {
  Widget child;
  HoverUp({Key? key,required this.child}) : super(key: key);

  @override
  _HoverUpState createState() => _HoverUpState();
}

class _HoverUpState extends State<HoverUp> {
  bool isHovered=false;

  @override
  Widget build(BuildContext context) {
    final hoverTransform=Matrix4.identity()..translate(0,-8,0);
    final transform=isHovered?hoverTransform:Matrix4.identity();
    return MouseRegion(
        onEnter: (event)=>onEntered(true),
        onExit: (event)=>onEntered(false),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            transform: transform,
            child: widget.child
        )
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
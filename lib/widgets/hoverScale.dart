import 'package:flutter/material.dart';

class HoverScale extends StatefulWidget {
  Widget child;
  HoverScale({Key? key,required this.child}) : super(key: key);

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool isHovered=false;

  @override
  Widget build(BuildContext context) {

    //scale just show child bigger 10% from his old size
    //and it's happened when you hover on this item
    final hoverTransform=Matrix4.identity()..scale(1.1);
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

  void onEntered(bool isHovered){
    setState(() {
      this.isHovered=isHovered;
    });
  }
}

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String tooltip;
  final Function onPress;
  final Color color;
  final Icon icon;

  Button({this.icon, this.color, this.tooltip, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 15),
        child: Ink(
          height: 35,
          width: 35,
          decoration: ShapeDecoration(
            color: color,
            shape: CircleBorder(),
          ),
          child: IconButton(
              icon: icon,
              tooltip: tooltip,
              color: Colors.white,
              onPressed: onPress),
        ));
  }
}

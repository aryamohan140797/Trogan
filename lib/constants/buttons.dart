import 'package:flutter/material.dart';

class Iconbuttons extends StatelessWidget {
  IconData icon;
  Color iconColor;
  double iconsize;
  VoidCallback onPressed;
  Iconbuttons({this.icon, this.iconColor, this.iconsize,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          this.onPressed();
        },
        child: Icon(
          icon,
          color: iconColor,
          size: iconsize,
        ),
      ),
    );
  }
}

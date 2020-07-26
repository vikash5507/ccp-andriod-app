import 'package:ccp/core/utils/colors.dart';
import 'package:ccp/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

//rounded login and other buttons widget e.g English etc.
//make button statefull - TODO

class RoundedButton extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  RoundedButton(
      {Key key,
      String text,
      double width,
      VoidCallback onPressed,
      Color color,
      Color textColor})
      : text = text,
        width = 0.9,
        onPressed = onPressed,
        color = Colors.blueAccent,
        textColor = Colors.white,
        super(key: key);

  // RoundedButton({
  //   Key key,
  //   this.width = 0.9,
  //   this.text,
  //   this.press,
  //   this.color = Colors.blueAccent,
  //   this.textColor = Colors.white,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //language buttons
      margin: EdgeInsets.symmetric(),
      width: screenWidth(context, multiplyBy: width),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15),
          color: color,
          onPressed: onPressed,
          child: Text(
            '$text',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

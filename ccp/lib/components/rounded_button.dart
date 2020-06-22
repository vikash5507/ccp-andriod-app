import 'package:flutter/material.dart';

//rounded login and other buttons widget e.g English etc.

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = Colors.blueAccent,
    this.textColor = Colors.white,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container( //language buttons
      margin: EdgeInsets.symmetric(),
      width: size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15),
          color: Colors.blueAccent,
          onPressed: press,
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
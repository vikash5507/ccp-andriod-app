import 'package:flutter/material.dart';

//skip to feed button

class SkipToFeed extends StatelessWidget {
  final Function press;
  const SkipToFeed({
    Key key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(),
      //width: size.width*0.1,
      child: FlatButton(
        onPressed: press,
        color: Colors.transparent,
        child: new Text(
          'Skip to Feed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            //decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
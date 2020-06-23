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
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: press,
        child: new Padding(
          padding: EdgeInsets.all(5.0),
          child: new Text(
            'Skip to Feed',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
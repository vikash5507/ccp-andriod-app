import 'package:flutter/material.dart';


//text field container widget for input

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 0.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: child,
    );
  }
}

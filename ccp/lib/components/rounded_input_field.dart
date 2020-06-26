import 'package:flutter/material.dart';
import 'package:ccp/components/text_field_container.dart';

//field for input of values in login/sign up

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool bordered;
  final borderedInputSize;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.bordered = false,
    this.borderedInputSize = 0.6,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: bordered == false ? 
      TextFieldContainer(
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            icon: Icon(icon,color: Colors.blueAccent),
            hintText: hintText,
            //border: InputBorder.none,
          ),
        ),
      ) :
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
        width: size.width * borderedInputSize,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
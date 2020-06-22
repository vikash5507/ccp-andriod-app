import 'package:flutter/material.dart';
import 'package:ccp/components/text_field_container.dart';

//field for input of values in login/sign up

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon,color: Colors.blueAccent),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
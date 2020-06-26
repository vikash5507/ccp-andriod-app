import 'package:flutter/material.dart';
import 'package:ccp/components/text_field_container.dart';


//password text field widget

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(Icons.lock,color: Colors.blueAccent),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.blueAccent,
          ),
          //border: InputBorder.none,
        ),
      ),
    );
  }
}

import 'package:ccp/ui/auth/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

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

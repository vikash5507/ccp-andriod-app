import 'package:ccp/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final VoidCallback _onPressed;

  SignupButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: _onPressed,
      color: primaryCcpColor,
      disabledColor: primaryCcpColor,
      child: Text('Signup'),
    );
  }
}
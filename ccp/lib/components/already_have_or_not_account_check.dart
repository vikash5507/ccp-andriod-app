import 'package:flutter/material.dart';

//already have or have not account check line widget

class AlreadyHaveOrNotAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveOrNotAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? 'Don\'t have an account ? ':'Already have an account ? ',
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ?'Sign Up' : 'Log  In',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

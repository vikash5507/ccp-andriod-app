import 'package:flutter/material.dart';


class AppLogo extends StatelessWidget {
  final Alignment alignm;
  const AppLogo({
    this.alignm = Alignment.center,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align ( //for logo of app
        alignment: alignm,
        child:
        Container (
          child: Image.asset(
            'assets/images/ci-logo-big.png',
            height: 30,
            width: 25,
            fit: BoxFit.cover,
          ),
        )
    );
  }
}

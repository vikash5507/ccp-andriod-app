import 'package:flutter/material.dart';
import 'package:ccp/screens/landing_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CCP',
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white70,
    ),
    home: LandingPageChooseLanguage(),
  ));
}






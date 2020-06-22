import 'package:ccp/components/rounded_button.dart';
import 'package:ccp/components/skip_to_feed.dart';
import 'package:ccp/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:ccp/components/rounded_input_field.dart';
import 'package:ccp/components/rounded_password_field.dart';
import 'package:ccp/components/already_have_or_not_account_check.dart';

//login screen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row ( //for logo of app
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height*0.25),
              Container (
                child: Image.asset(
                  'assets/images/ci-logo-big.png',
                  height: 60,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              'Log in to CCP.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          RoundedInputField(
            hintText: 'Email, Phone no. or Username',
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          SizedBox(height: size.height*0.02),
          RoundedButton(
            text: 'LOGIN',
            press: () {},
          ),
          SizedBox(height: size.height*0.03),
          AlreadyHaveOrNotAccountCheck(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    }
                  ),
              );
            },
          ),
          SizedBox(height: size.height*0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SkipToFeed(
                press: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}





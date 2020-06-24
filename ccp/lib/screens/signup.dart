import 'package:ccp/components/already_have_or_not_account_check.dart';
import 'package:ccp/components/rounded_button.dart';
import 'package:ccp/components/rounded_input_field.dart';
import 'package:ccp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:ccp/components/rounded_password_field.dart';
import 'package:ccp/components/or_divider.dart';

//signup page

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: 
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row ( //for logo of app
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height*0.15),
                Container (
                  child: Image.asset(
                    'assets/images/ci-logo-big.png',
                    height: 30,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Create your account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35
                  ),
                )
              ],
            ),
            RoundedInputField(
              hintText: 'Phone Number or Email',
              onChanged: (value) {},
              icon: Icons.email,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            SizedBox(height: size.height*0.01),
            RoundedButton(
              text: 'SIGNUP',
              press: () {},
            ),
            SizedBox(height: size.height*0.02),
            AlreadyHaveOrNotAccountCheck(
              login: false,
              press: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  }
                ),
                );
              },
            ),
            SizedBox(height: size.height*0.02),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Image.asset(
                      'assets/images/fb.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


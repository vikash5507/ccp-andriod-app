import 'package:ccp/components/or_divider.dart';
import 'package:ccp/components/rounded_button.dart';
import 'package:ccp/components/skip_to_feed.dart';
import 'package:ccp/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:ccp/components/rounded_input_field.dart';
import 'package:ccp/components/rounded_password_field.dart';
import 'package:ccp/components/already_have_or_not_account_check.dart';
import 'package:ccp/components/app_logo_for_appbar.dart';

//login screen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.blueAccent,
        ),
        centerTitle: true,
        title: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 35,maxWidth: 200),
          child: AppLogo(),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 18.0, 15.0, 0.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUpScreen();},),);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Log in to Duckhosla',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: size.height*0.03),
            RoundedInputField(
              hintText: 'Email, Phone no. or Username',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            SizedBox(height: size.height*0.03),
            RoundedButton(
              text: 'LOGIN',
              press: () {},
            ),
            SizedBox(height: size.height*0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height*0.02),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    //padding: EdgeInsets.all(1),
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
      bottomNavigationBar: new BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SkipToFeed(
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}





import 'package:ccp/components/already_have_or_not_account_check.dart';
import 'package:ccp/components/app_logo_for_appbar.dart';
import 'package:ccp/components/rounded_button.dart';
import 'package:ccp/components/rounded_input_field.dart';
import 'package:ccp/components/skip_to_feed.dart';
import 'package:ccp/screens/login.dart';
import 'package:ccp/screens/otp_verification_after_signup.dart';
import 'package:flutter/material.dart';
import 'package:ccp/components/rounded_password_field.dart';
import 'package:ccp/components/or_divider.dart';

//signup page


class SignUpScreen extends StatelessWidget {
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
      ),
      body:
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Create your account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height*0.1,),
              RoundedInputField(
                hintText: 'Full Name',
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: 'Phone Number or Email',
                onChanged: (value) {},
                icon: Icons.email,
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              SizedBox(height: size.height*0.03),
              RoundedButton(
                text: 'SIGNUP',
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {return VerifyOtp();},),);
                },
              ),
              SizedBox(height: size.height*0.02),
              /*AlreadyHaveOrNotAccountCheck(
                login: false,
                press: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    }
                  ),
                  );
                },
              ),*/
              SizedBox(height: size.height*0.01),
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
              Text(
                'By signing up, you agree to our Terms,'
              ),
              Text(
                'Data Policy and Cokiee Policy'
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


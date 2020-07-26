import 'package:ccp/ui/auth/pages/signup.dart';
import 'package:ccp/ui/auth/pages/upload_dp_after_otp.dart';
import 'package:ccp/ui/auth/widgets/app_logo_for_appbar.dart';
import 'package:ccp/ui/auth/widgets/rounded_button.dart';
import 'package:ccp/ui/auth/widgets/rounded_input_field.dart';
import 'package:flutter/material.dart';


class VerifyOtp extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height*0.05,),
              Text(
                'Verify your code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: size.height*0.2,),
              RoundedInputField(
                hintText: 'Enter 6 digit code',
                bordered: true,
              ),
              SizedBox(height: size.height*0.015,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Didn\'t receive OTP? '
                  ),
                  GestureDetector(
                    child: Text (
                      'Send Again',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height*0.02,),
              RoundedButton(
                text: 'Verify',
                width: 0.7,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {return UploadProfilePic();},),);
                },
              ),
              SizedBox(height: size.height*0.015,),
              RoundedButton(
                text: 'Cancel',
                width: 0.7,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUpScreen();},),);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: LinearProgressIndicator(
        value: 0.25,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
    );
  }
}


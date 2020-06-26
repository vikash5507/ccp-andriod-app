import 'package:ccp/screens/choose_location.dart';
import 'package:ccp/upload_dp/upload_dp_circle.dart';
import 'package:flutter/material.dart';
import 'package:ccp/components/app_logo_for_appbar.dart';
import 'package:ccp/components/rounded_button.dart';


class UploadProfilePic extends StatelessWidget {
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
          constraints: BoxConstraints(maxHeight: 35, maxWidth: 200),
          child: AppLogo(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Upload Profile Picture',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              new UploadDpCircle(),
              RoundedButton(
                text: 'Upload',
                width: 0.7,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChooseLocation();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              RoundedButton(
                text: 'Skip for now',
                width: 0.7,
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {return ChooseLocation();},),);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: LinearProgressIndicator(
        value: 0.50,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
    );
  }
}



import 'dart:io';

import 'package:ccp/page/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ccp/helper/enum.dart';
import 'package:ccp/helper/theme.dart';
import 'package:ccp/page/Auth/selectAuthMethod.dart';
import 'package:ccp/state/authState.dart';
import 'package:ccp/widgets/customWidgets.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer();
    });
    super.initState();
  }

  void timer() async {
    Future.delayed(Duration(seconds: 1)).then((_) {
      var state = Provider.of<AuthState>(context, listen: false);
      // state.authStatus = AuthStatus.NOT_DETERMINED;
      state.getCurrentUser();
    });
  }

  Widget _body() {
    var height = 150.0;
    return Container(
      height: fullHeight(context),
      width: fullWidth(context),
      child: Container(
        height: height,
        width: height,
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Platform.isIOS
                  ? CupertinoActivityIndicator(
                      radius: 35,
                    )
                  : CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
              Image.asset(
                'assets/images/ci-logo-big.png',
                height: 30,
                width: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AuthState>(context);
    print("Inside Splash Page build");
    return Scaffold(
      backgroundColor: CcpColor.white,
      body: state.authStatus == AuthStatus.NOT_DETERMINED
          ? _body()
          : state.authStatus == AuthStatus.NOT_LOGGED_IN
              ? WelcomePage()
              : HomePage(),
              //: Container(child: Text("HomePage route !!"),), //ToDo
    );
  }
}

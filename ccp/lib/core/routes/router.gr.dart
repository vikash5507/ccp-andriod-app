// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ccp/ui/auth/app_widget.dart';
import 'package:ccp/ui/auth/pages/landing_page.dart';
import 'package:ccp/data/auth/repository/user_repository.dart';
import 'package:ccp/ui/auth/pages/signup.dart';
import 'package:ccp/ui/auth/pages/login.dart';
import 'package:ccp/ui/auth/pages/signup_complete.dart';
import 'package:ccp/ui/auth/pages/otp_verification_after_signup.dart';
import 'package:ccp/ui/auth/pages/choose_location.dart';
import 'package:ccp/ui/auth/pages/upload_dp_after_otp.dart';

class Routes {
  static const String appWidget = '/';
  static const String landingPageChooseLanguage =
      '/landing-page-choose-language';
  static const String signUpScreen = '/sign-up-screen';
  static const String loginScreen = '/login-screen';
  static const String signUpComplete = '/sign-up-complete';
  static const String verifyOtp = '/verify-otp';
  static const String chooseLocation = '/choose-location';
  static const String uploadProfilePic = '/upload-profile-pic';
  static const all = <String>{
    appWidget,
    landingPageChooseLanguage,
    signUpScreen,
    loginScreen,
    signUpComplete,
    verifyOtp,
    chooseLocation,
    uploadProfilePic,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.appWidget, page: AppWidget),
    RouteDef(Routes.landingPageChooseLanguage, page: LandingPageChooseLanguage),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.signUpComplete, page: SignUpComplete),
    RouteDef(Routes.verifyOtp, page: VerifyOtp),
    RouteDef(Routes.chooseLocation, page: ChooseLocation),
    RouteDef(Routes.uploadProfilePic, page: UploadProfilePic),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AppWidget: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppWidget(),
        settings: data,
      );
    },
    LandingPageChooseLanguage: (RouteData data) {
      var args =
          data.getArgs<LandingPageChooseLanguageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => LandingPageChooseLanguage(
            key: args.key, userRepository: args.userRepository),
        settings: data,
      );
    },
    SignUpScreen: (RouteData data) {
      var args = data.getArgs<SignUpScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            SignUpScreen(key: args.key, userRepository: args.userRepository),
        settings: data,
      );
    },
    LoginScreen: (RouteData data) {
      var args = data.getArgs<LoginScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            LoginScreen(key: args.key, userRepository: args.userRepository),
        settings: data,
      );
    },
    SignUpComplete: (RouteData data) {
      var args = data.getArgs<SignUpCompleteArguments>(
          orElse: () => SignUpCompleteArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpComplete(key: args.key, name: args.name),
        settings: data,
      );
    },
    VerifyOtp: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VerifyOtp(),
        settings: data,
      );
    },
    ChooseLocation: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChooseLocation(),
        settings: data,
      );
    },
    UploadProfilePic: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UploadProfilePic(),
        settings: data,
      );
    },
  };
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future<dynamic> pushAppWidget() => push<dynamic>(Routes.appWidget);

  Future<dynamic> pushLandingPageChooseLanguage({
    Key key,
    @required UserRepository userRepository,
  }) =>
      push<dynamic>(
        Routes.landingPageChooseLanguage,
        arguments: LandingPageChooseLanguageArguments(
            key: key, userRepository: userRepository),
      );

  Future<dynamic> pushSignUpScreen({
    Key key,
    @required UserRepository userRepository,
  }) =>
      push<dynamic>(
        Routes.signUpScreen,
        arguments:
            SignUpScreenArguments(key: key, userRepository: userRepository),
      );

  Future<dynamic> pushLoginScreen({
    Key key,
    @required UserRepository userRepository,
  }) =>
      push<dynamic>(
        Routes.loginScreen,
        arguments:
            LoginScreenArguments(key: key, userRepository: userRepository),
      );

  Future<dynamic> pushSignUpComplete({
    Key key,
    String name,
  }) =>
      push<dynamic>(
        Routes.signUpComplete,
        arguments: SignUpCompleteArguments(key: key, name: name),
      );

  Future<dynamic> pushVerifyOtp() => push<dynamic>(Routes.verifyOtp);

  Future<dynamic> pushChooseLocation() =>
      push<dynamic>(Routes.chooseLocation);

  Future<dynamic> pushUploadProfilePic() =>
      push<dynamic>(Routes.uploadProfilePic);
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//LandingPageChooseLanguage arguments holder class
class LandingPageChooseLanguageArguments {
  final Key key;
  final UserRepository userRepository;
  LandingPageChooseLanguageArguments({this.key, @required this.userRepository});
}

//SignUpScreen arguments holder class
class SignUpScreenArguments {
  final Key key;
  final UserRepository userRepository;
  SignUpScreenArguments({this.key, @required this.userRepository});
}

//LoginScreen arguments holder class
class LoginScreenArguments {
  final Key key;
  final UserRepository userRepository;
  LoginScreenArguments({this.key, @required this.userRepository});
}

//SignUpComplete arguments holder class
class SignUpCompleteArguments {
  final Key key;
  final String name;
  SignUpCompleteArguments({this.key, this.name});
}

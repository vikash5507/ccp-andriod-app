import 'dart:async';
import 'dart:convert';

import 'package:ccp/data/auth/models/user_model.dart';
import 'package:ccp/helper/backend_const.dart';
import 'package:ccp/helper/utility.dart';
import 'package:ccp/model/user.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  //Dio dio = new Dio();

  Future<AuthUser> signUp(
      {String fullname, String email, String password}) async {
    // TODO: implement signUp
    final data = {'fullname': fullname, 'password': password, 'email': email};
    AuthUser signedUpUser;
    try {
      final response = await http.post(BackendConstants.signUpUrl, body: data);
      print("User_Repository: " + response.body);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        signedUpUser = AuthUser.fromJson(jsonDecode(response.body));
        //print("signup successful"+signedUpUser.username.toString());
        //return signedUpUser;
      } else if (response.statusCode == 409) {
        //User already registered
        logEvent(response.body);
      }
    } catch (e) {
      logEvent("Something Wrong in signing up user");
    }
    return signedUpUser;
    // return AuthUser(
    //     uid: '123',
    //     email: 'abc@gmail.com',
    //     fullname: 'Dummy',
    //     username: 'not-return');
  }

  // Future<bool> isUserAlreadyExist(String username) async {
  //   final getUserUrl = BackendConstants.getUserUrl+'?='+username;
  //   try{
  //     logEvent("Checking If user already exist, while signup!");
  //     final response = await http.get(getUserUrl);
  //     if (response.statusCode == 200) {
  //       logEvent("User already exist");
  //       return true;
  //     } else if (response.statusCode == 409) {
  //       logEvent("User doesn't exist");
  //       return false;
  //     }
  //   } catch(e){
  //     logEvent("Exception Occured in method isUserAlreadyExist");
  //   }
  // }
  //Store Locally in shared_preferences if user ever logged in or not

  Future<AuthUser> signInWithCredentials(
      {String email, String password}) async {
    final data = {'email': email, 'password': password};
    AuthUser signedInUser;
    try {
      final response = await http.post(BackendConstants.loginUrl, body: data);
      print("User_Repository: " + response.body);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        signedInUser = AuthUser.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 409) {
        //User is inactive
        logEvent(response.body);
      }
    } catch (e) {
      logEvent("Username or Password is incorrect");
    }
    return signedInUser;
    // return AuthUser(
    //     uid: '123',
    //     email: 'abc@gmail.com',
    //     fullname: 'Dummy Duck',
    //     username: 'not-return');
  }

  Future<bool> isLoggedIn() async {
    return true;
    //final random = Random();
    //return random.nextBool();
    // final response = await http.get(BackendConstants.getUserUrl);
    // print(response.body);
    // if (response.statusCode != 400) {
    //   print("Bad request");
    //   return true;
    // }
    // return false;
  }

  Future<void> logOut() async {
    return Future.wait({});
  }

  Future<AuthUser> getUser() async {
    //return null;
    //bool isLogged = await isLoggedIn();
    //final data = {};
    AuthUser signedInUser;
    User signedInUserProfile;
    try {
      print("Inside User_repository getUser");
      final response = await http.get(BackendConstants.getProfileUrl);
      print("Logged In User Profile: " + response.body);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        signedInUserProfile = User.fromJson(jsonDecode(response.body));
        //signedInUser.email = signedInUserProfile.email;
        //signedInUserProfile.userId = signedInUserProfile.uid;
        print("Inside User_repository getUser");
        logEvent(signedInUserProfile.toString());
      } else {
        //User is inactive
        logEvent(response.body);
      }
    } catch (e) {
      logEvent("Username or Password is incorrect");
    }
    return signedInUser;

    // if (isLogged) {
    //   return AuthUser(
    //       uid: '1234',
    //       email: 'abc@gmail.com',
    //       fullname: 'Dummy Duck',
    //       username: 'not-return');
    // } else {
    //   return AuthUser(
    //       uid: '1234',
    //       email: 'abc@gmail.com',
    //       fullname: 'Bluff Duck',
    //       username: 'not-return');
    // }
  }

  Future<AuthUser> signInWithGoogle() async {
    return AuthUser(
        uid: '123',
        email: 'abc@gmail.com',
        fullname: 'Dummy Duck',
        username: 'not-return');
  }

  Future<AuthUser> signInWithFacebook() async {
    return AuthUser(
        uid: '123',
        email: 'abc@gmail.com',
        fullname: 'Dummy Duck',
        username: 'not-return');
  }

  Future<String> sendPasswordResetEmail({String email}) async {
    String link = "Dummy Reset url String!!";
    return link;
  }
}

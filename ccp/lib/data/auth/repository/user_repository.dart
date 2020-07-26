import 'dart:async';
import 'dart:math';

import 'package:ccp/core/utils/constants/backend_const.dart';
import 'package:ccp/data/auth/models/user_model.dart';
import 'package:http/http.dart' as http;



class UserRepository {

  Future<bool> signUp({String fullname, String email, String password}) async {
    // TODO: implement signUp
    //Map<String, dynamic> signUpBody = user.toJson();
    // final response = await http.post(BackendConstants.signUpUrl,
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(signUpBody));
    // print(jsonDecode(response.body));
    // if (response.statusCode == 201) {
    //   return true;
    // } else {
    //   return false;
    // }
    //return true;
    final random = Random();
    return random.nextBool();
  }

  //Store Locally in shared_preferences if user ever logged in or not
  

  Future<User> signInWithCredentials({String email, String password}) async {
    return User(email: 'abc@gmail.com', fullname: 'Dummy', password: 'not-return');
  }

  Future<bool> isLoggedIn() async {
    return false;
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

  Future<User> getUser() async {
    return User(email: 'abc@gmail.com', fullname: 'Dummy', password: 'not-return');
  }

  Future<User> signInWithGoogle() async {
    return User(email: 'abc@gmail.com', fullname: 'Dummy', password: 'not-return');
  }

  Future<User> signInWithFacebook() async{
    return User(email: 'abc@gmail.com', fullname: 'Dummy', password: 'not-return');
  }
  
}

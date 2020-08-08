import 'dart:async';

import 'package:ccp/data/auth/models/user_model.dart';
import 'package:ccp/helper/backend_const.dart';
import 'package:http/http.dart' as http;


class UserRepository {

  Future<AuthUser> signUp({String fullname, String email, String password}) async {
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
    //final random = Random();
    //return random.nextBool();
    return AuthUser(uid: '123',email: 'abc@gmail.com', fullname: 'Dummy', password: 'not-return');
  }

  //Store Locally in shared_preferences if user ever logged in or not
  

  Future<AuthUser> signInWithCredentials({String email, String password}) async {
    return AuthUser(uid: '123',email: 'abc@gmail.com', fullname: 'Dummy Duck', password: 'not-return');
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
    bool isLogged = await isLoggedIn();
    if(isLogged) {
      return AuthUser(uid: '1234', email: 'abc@gmail.com', fullname: 'Dummy Duck', password: 'not-return');
    } else {
      return AuthUser(uid: '1234', email: 'abc@gmail.com', fullname: 'Bluff Duck', password: 'not-return');
    }
    
  }

  Future<AuthUser> signInWithGoogle() async {
    return AuthUser(uid: '123',email: 'abc@gmail.com', fullname: 'Dummy Duck', password: 'not-return');
  }

  Future<AuthUser> signInWithFacebook() async{
    return AuthUser(uid: '123',email: 'abc@gmail.com', fullname: 'Dummy Duck', password: 'not-return');
  }

  Future<String> sendPasswordResetEmail({String email}) async{
    String link = "Dummy Reset url String!!";
    return link;
  }
  
}

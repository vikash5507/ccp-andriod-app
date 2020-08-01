
import 'package:ccp/data/auth/models/user_model.dart';
import 'package:ccp/data/auth/repository/user_repository.dart';
import 'package:ccp/helper/constant.dart';
import 'package:ccp/helper/enum.dart';
import 'package:ccp/helper/utility.dart';
import 'package:ccp/model/user.dart';
import 'package:ccp/widgets/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'appState.dart';
//import 'package:firebase_database/firebase_database.dart' as dabase;

class AuthState extends AppState {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  final UserRepository _userRepository = UserRepository();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthUser user;
  String userId;
  User _userModel = User(email: "vikash@gmail.com", userId: "1234", displayName: "Dumro Duck", profilePic: dummyProfilePic, key: "1", contact: "12333", bio: "President of Duck", dob: "22222", location: "Intenet", createdAt: "Home", userName: "Duck123", isVerified: true, followers: 1234334, following: 7, fcmToken: "ghanta", webSite: "dumroo.com", followersList: ["alpha", "beta"]); //ToDO remove this after integrating it backend

  User get userModel => _userModel;
  
  Future<AuthUser> getCurrentUser() async {
    try{
      loading = true;
      logEvent("get CurrentAuthUser");
      user = await _userRepository.getUser();
      if(user != null) {
        authStatus = AuthStatus.LOGGED_IN;
        userId = user.uid;
      } else {
        authStatus = AuthStatus.NOT_LOGGED_IN;
      }
      loading = false;
      return user;
    } catch (error) {
      loading = false;
      cprint(error, errorIn: 'getCurrentUser');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      return null;
    }
  }

  Future<String> signIn(String email, String password, {GlobalKey<ScaffoldState> scaffoldKey}) async {
    try{
      loading = true;
      logEvent("user SignedIn with Credentials");
      user = await _userRepository.signInWithCredentials(email: email, password: password);
      userId = user.uid;
      _userModel = userModel;
      //authStatus = AuthStatus.LOGGED_IN;
      return user.uid;
    } catch (error) {
      loading = false;
      cprint(error, errorIn: 'signIn');
      customSnackBar(scaffoldKey, error.message);
      return null;
    }
  }

  Future<String> signUp(User userModel, {GlobalKey<ScaffoldState> scaffoldKey, String password}) async {
    try{
      loading = true;
      logEvent("user SignedUp with Credentials");
      user = await _userRepository.signUp(fullname: userModel.displayName, email: userModel.email, password: password);
      authStatus = AuthStatus.LOGGED_IN;
      _userModel = userModel;
      _userModel.key = user.uid;
      _userModel.userId = user.uid;
      _userModel.profilePic = dummyProfilePic;
      createUser(_userModel, newUser: true);
      //ToDo - push to DB
      return user.uid;
    } catch (error) {
      loading = false;
      cprint(error, errorIn: 'signUp');
      customSnackBar(scaffoldKey, error.message);
      return null;
    }
  }
  

  Future<AuthUser> handleGoogleSignIn() async {
    try{
      loading = true;
      logEvent("user SignedIn with Credentials");
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google login cancelled by user');
      }

      user = await _userRepository.signInWithCredentials(email: 'email@gmail.com', password: 'password');
      authStatus = AuthStatus.LOGGED_IN;
      userId = user.uid;
      return user;
    } catch (error) {
      loading = false;
      cprint(error, errorIn: 'signIn');
      return null;
    }
  }

  /// Send password reset link to email
  Future<bool> forgetPassword(String email,
      {GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      await _userRepository.sendPasswordResetEmail(email: email).then((value) {
        customSnackBar(scaffoldKey,
            'A reset password link is sent yo your mail.You can reset your password from there');
        logEvent('forgot+password');
        return true;
      }).catchError((error) {
        cprint(error.message);
        return false;
      });
    } catch (error) {
      customSnackBar(scaffoldKey, error.message);
      return Future.value(false);
    }
    return false;
  }

  /// Logout from device
  void logoutCallback() {
    authStatus = AuthStatus.NOT_LOGGED_IN;
    userId = '';
    _userModel = null;
    user = null;
    //_profileUserModelList = null;
    // if (isSignInWithGoogle) {
    //   _googleSignIn.signOut();
    //   logEvent('google_logout');
    // }
    // _firebaseAuth.signOut();
    notifyListeners();
  }

  /// `Create` and `Update` user
  /// IF `newUser` is true new user is created
  /// Else existing user will update with new values
  createUser(User user, {bool newUser = false}) {
    if (newUser) {
      // Create username by the combination of name and id
      user.userName = getUserName(id: user.userId, name: user.displayName);
      logEvent('create_newUser');

      // Time at which user is created
      user.createdAt = DateTime.now().toUtc().toString();
    }

    _userModel = user;
    loading = false;
  }

  /// ToDo - i don't know if it's needed or not -> Fetch user profile 
 /// If `userProfileId` is null then logged in user's profile will fetched
  getProfileUser({String userProfileId}) {
    try {
      loading = true;
      
      userProfileId = userProfileId == null ? user.uid : userProfileId;
    } catch (error) {
      loading = false;
      cprint(error, errorIn: 'getProfileUser');
    }
  }

}
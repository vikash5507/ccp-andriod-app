import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AuthUser extends Equatable {
  final String uid;
  final String fullname;
  final String email;
  final String password;

  AuthUser(
      {@required this.uid, @required this.fullname, @required this.email, @required this.password});

  @override
  List<Object> get props => [uid, fullname, email, password];

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
        uid: json['uid'],
        fullname: json['fullname'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fullname': fullname,
      'email': email,
      'password': password,
    };
  }
}

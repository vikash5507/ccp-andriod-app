import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String fullname;
  final String email;
  final String password;

  User({
    @required this.fullname, 
    @required this.email, 
    @required this.password
  });

  @override
  List<Object> get props => [fullname, email, password];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(fullname: json['fullname'], email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
    };
  }
}

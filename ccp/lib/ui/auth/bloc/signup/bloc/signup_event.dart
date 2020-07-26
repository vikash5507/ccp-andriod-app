part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupEmailChanged extends SignupEvent {
  final String email;

  const SignupEmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'SignupEmailChanged { email :$email }';
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  const SignupPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'SignupPasswordChanged { password: $password }';
}

class SignupSubmitted extends SignupEvent {
  final String fullname;
  final String email;
  final String password;

  const SignupSubmitted({
    @required this.fullname,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [fullname, email, password];

  @override
  String toString() {
    return 'SignupSubmitted { fullname: $fullname, email: $email, password: $password }';
  }
}
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthEvent {}

class AuthStartedEvent extends AuthEvent {}

class AuthLoggedInEvent extends AuthEvent {}

class AuthLoggedOutEvent extends AuthEvent {}

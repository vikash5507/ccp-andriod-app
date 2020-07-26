part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AppStartedState extends AuthState {}

class AuthInitialState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String displayName;

  const AuthSuccessState(this.displayName);

  @override
  List<Object> get props => ['displayName'];

  @override
  String toString() => 'Authent Success { displayName: $displayName }'; 
  
}

class AuthFailureState extends AuthState {}

class AuthLoadingState extends AuthState {}

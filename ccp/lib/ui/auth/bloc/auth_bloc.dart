import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ccp/core/utils/localization/language_constants.dart';
import 'package:ccp/data/auth/models/user_model.dart';
import 'package:ccp/data/auth/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(AppStartedState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is AppStartedEvent) {
      yield* _mapAppStartedToState();
    }
    if (event is AuthStartedEvent) {
      yield* _mapAuthInitialToState();
    } else if (event is AuthLoggedInEvent) {
      yield* _mapAuthSuccessToState();
    } else if (event is AuthLoggedOutEvent) {
      yield* _mapAuthFailureToState();
    }
  }

  Stream<AuthState> _mapAuthInitialToState() async* {
    final isLoggedIn = await _userRepository.isLoggedIn();
    //await clearSharedPreferences();
    //final isLangLocaleSet = await isLocaleSet();

    //if (isLangLocaleSet) {
    if (isLoggedIn) {
      //ToDO Get user detail from user repository
      yield AuthSuccessState("Dummy-Slate");
    } else {
      //yield AuthFailureState(); //ToDo fix this
      yield AuthInitialState();
    }
    // } else {
    //   print("Nothing was stored!!");
    //   yield AppStartedState();
    // }
  }

  Stream<AuthState> _mapAuthSuccessToState() async* {
    //ToDO Get user detail from user repository
    yield AuthSuccessState("Dummy-Slate");
  }

  Stream<AuthState> _mapAuthFailureToState() async* {
    yield AuthFailureState();
    //ToDO Logout out from user repository - clear local cache
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    await clearSharedPreferences();
    final isLangLocaleSet = await isLocaleSet();
    if (isLangLocaleSet) {
      final isLoggedIn = await _userRepository.isLoggedIn();
      if(isLoggedIn) {
        yield AuthSuccessState("Dummy-Slate");
      } else {
        yield AuthInitialState();
      }
      
    } else {
      yield AppStartedState();
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ccp/core/utils/validators.dart';
import 'package:ccp/data/auth/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository _userRepository;

  SignupBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(SignupState.initial());

  @override
  Stream<Transition<SignupEvent, SignupState>> transformEvents(
    Stream<SignupEvent> events,
    TransitionFunction<SignupEvent, SignupState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! SignupEmailChanged && event is! SignupPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is SignupEmailChanged || event is SignupPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignupEmailChanged) {
      yield* _mapSignupEmailChangedToState(event.email);
    } else if (event is SignupPasswordChanged) {
      yield* _mapSignupPasswordChangedToState(event.password);
    } else if (event is SignupSubmitted) {
      yield* _mapSignupSubmittedToState(event.fullname, event.email, event.password);
    }
  }

  Stream<SignupState> _mapSignupEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<SignupState> _mapSignupPasswordChangedToState(
      String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<SignupState> _mapSignupSubmittedToState(
    String fullname,
    String email,
    String password,
  ) async* {
    yield SignupState.loading();
    try {
      await _userRepository.signUp(
        fullname: fullname,
        email: email,
        password: password,
      );
      yield SignupState.success();
    } catch (_) {
      yield SignupState.failure();
    }
  }

}

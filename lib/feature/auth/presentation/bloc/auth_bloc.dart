import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }
  register(RegisterEvent event, Emitter emit) async {
    try {
      emit(RegisterLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('The password provided is too weak.'));
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('The account already exists for that email.'));
        log('The account already exists for that email.');
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(AuthErrorState("have an error"));
    }
  }

  login(LoginEvent event, Emitter emit) async {
    emit(LoginLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState('No user found for that email.'));
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState('Wrong password provided for that user.'));
        log('Wrong password provided for that user.');
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(AuthErrorState("have an error"));
    }
  }
}

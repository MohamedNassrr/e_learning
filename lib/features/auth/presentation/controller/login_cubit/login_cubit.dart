import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_learning/core/failures/firebase_auth_failure.dart';
import 'package:e_learning/core/services/facebook_service.dart';
import 'package:e_learning/core/services/google_service.dart';
import 'package:e_learning/features/auth/presentation/controller/login_cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.googleService, this._faceBookService)
    : super(LoginInitialStates());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleService googleService;
  final FaceBookService _faceBookService;

  Future<dynamic> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingStates());
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessStates());
    } catch (e) {
      emit(LoginFailureStates(e.toString()));
      log(e.toString());
      if (e is FirebaseAuthException) {
        return FirebaseAuthFailure.fromCode(e.toString());
      }
      return FirebaseAuthFailure(message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      await googleService.signInWithGoogle();
      emit(LoginGoogleSuccessStates());
    } catch (e) {
      log('google service failure: ${e.toString()}');
      emit(LoginGoogleFailureStates(e.toString()));
    }
  }

  Future<void> googleSignOut() async {
    await googleService.signOut();
    emit(UserLogoutWithGoogleSuccess());
  }

  Future<void> facebookSignIn() async {
    try {
      await _faceBookService.facebookSignIn();
      emit(LoginFacebookSuccessStates());
    } catch (e) {
      log('facebook service failure: ${e.toString()}');
      emit(LoginFacebookFailureStates(e.toString()));
    }
  }

  Future<void> facebookSignOut() async {
    await _faceBookService.facebookSignOut();
    emit(UserLogoutWithFacebookSuccess());
  }

  Future<dynamic> guestLogin() async {
    try {
      await _auth.signInAnonymously();
      emit(LoginGuestModeSuccessStates());
    } catch (e) {
      emit(LoginFailureStates(e.toString()));
      log(e.toString());
      if (e is FirebaseAuthException) {
        return FirebaseAuthFailure.fromCode(e.toString());
      }
      return FirebaseAuthFailure(message: e.toString());
    }
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityStates());
  }
}

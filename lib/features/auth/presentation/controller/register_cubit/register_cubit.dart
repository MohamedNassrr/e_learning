import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/features/auth/data/models/register_model.dart';
import 'package:e_learning/features/auth/presentation/controller/register_cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  void addUser({
    required String email,
    required String userName,
    required String password,
    required String phoneNumber,
  })  {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          createUser(
            email: email,
            userName: userName,
            phoneNumber: phoneNumber,
            uId: value.user!.uid,
          );
          emit(RegisterSuccessState());
        })
        .catchError((failure) {
          log('failure in register ${failure.toString()}');
          emit(RegisterFailureState(failure.toString()));
        });
  }

  void createUser({
    required String email,
    required String userName,
    required String phoneNumber,
    required String uId,
  }) {
    RegisterModel registerModel = RegisterModel(
      email: email,
      userName: userName,
      phone: phoneNumber,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(registerModel.toMap())
        .then((_) {
          emit(CreateUserSuccessState());
        })
        .catchError((failure) {
          log('error in create user: ${failure.toString()}');
          emit(CreateUserFailureState(failure.toString()));
        });
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

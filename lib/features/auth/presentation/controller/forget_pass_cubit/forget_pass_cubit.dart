import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_learning/features/auth/presentation/controller/forget_pass_cubit/forget_pass_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassInitialStates());

  void changePassword({required String email}) {
    emit(ForgetPassLoadingStates());

    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgetPassSuccessStates());
    } catch (e) {
      log('failure in forgetPass: ${e.toString()}');
      emit(ForgetPassFailureStates(e.toString()));
    }
  }
}

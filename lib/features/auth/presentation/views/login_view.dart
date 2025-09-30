import 'package:e_learning/core/services/facebook_service.dart';
import 'package:e_learning/core/services/google_service.dart';
import 'package:e_learning/core/services/service_locator.dart';
import 'package:e_learning/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:e_learning/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider(
          create:
              (context) => LoginCubit(
                getIt.get<GoogleService>(),
                getIt.get<FaceBookService>(),
              ),
          child: const LoginViewBody(),
        ),
      ),
    );
  }
}

import 'package:e_learning/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:e_learning/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const RegisterViewBody(),
        ),
      ),
    );
  }
}

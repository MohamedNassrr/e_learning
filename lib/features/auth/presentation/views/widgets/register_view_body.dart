import 'package:e_learning/core/utils/app_router.dart';
import 'package:e_learning/core/widgets/custom_form_field.dart';
import 'package:e_learning/core/widgets/custom_register_login_button.dart';
import 'package:e_learning/core/widgets/custom_text_button.dart';
import 'package:e_learning/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:e_learning/features/auth/presentation/controller/register_cubit/register_state.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is CreateUserSuccessState) {
          GoRouter.of(context).pushReplacement(AppRouter.rLoginSreen);
        }

        if (state is RegisterFailureState) {
          SnackBar snackBar = SnackBar(content: Text(state.failure.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is CreateUserFailureState) {
          SnackBar snackBar = SnackBar(content: Text(state.failure.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var registerCubit = context.read<RegisterCubit>();
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 14,
              children: [
                CustomFormField(
                  controller: userNameController,
                  hintText: S.of(context).username,
                  type: TextInputType.text,
                  suffix: Icons.person,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).usernameValidation;
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  controller: emailController,
                  hintText: 'user@example.com',
                  type: TextInputType.emailAddress,
                  suffix: Icons.email_rounded,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).emailValidation;
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  controller: passwordController,
                  hintText: S.of(context).password,
                  type: TextInputType.text,
                  suffix: registerCubit.suffix,
                  isPassword: registerCubit.isPassword,
                  suffixPressed: registerCubit.changePasswordVisibility,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).passwordValidation;
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  controller: confirmPasswordController,
                  hintText: S.of(context).confirmPassword,
                  type: TextInputType.text,
                  suffix: registerCubit.suffix,
                  isPassword: registerCubit.isPassword,
                  suffixPressed: registerCubit.changePasswordVisibility,
                  validation: (value) {
                    if (value != passwordController.text) {
                      return S.of(context).passwordNotMatch;
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  controller: phoneController,
                  hintText: '01XX XX XXXXX',
                  type: TextInputType.text,
                  suffix: Icons.phone,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).passwordValidation;
                    }
                    return null;
                  },
                ),
                CustomTextButton(
                  isLoading: state is RegisterLoadingState,
                  title: S.of(context).continueText,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      registerCubit.addUser(
                        email: emailController.text,
                        userName: userNameController.text,
                        password: passwordController.text,
                        phoneNumber: phoneController.text,
                      );
                    }
                  },
                ),
                CustomRegisterLoginButton(
                  text: S.of(context).alreadyHaveAccount,
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  pressableText: S.of(context).login,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

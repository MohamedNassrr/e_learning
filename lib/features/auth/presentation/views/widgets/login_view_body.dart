import 'package:e_learning/core/utils/app_router.dart';
import 'package:e_learning/core/widgets/custom_divider.dart';
import 'package:e_learning/core/widgets/custom_form_field.dart';
import 'package:e_learning/core/widgets/custom_register_login_button.dart';
import 'package:e_learning/core/widgets/custom_text_button.dart';
import 'package:e_learning/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:e_learning/features/auth/presentation/controller/login_cubit/login_state.dart';
import 'package:e_learning/features/auth/presentation/views/widgets/social_login_body.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _handleListener(context, state) {
    if (state is LoginSuccessStates ||
        state is LoginFacebookSuccessStates ||
        state is LoginGoogleSuccessStates ||
        state is LoginGuestModeSuccessStates) {
      GoRouter.of(context).pushReplacement(AppRouter.rHomeScreen);
    }

    if (state is LoginFailureStates) {
      SnackBar snackBar = SnackBar(content: Text(state.failure.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: _handleListener,
      builder: (context, state) {
        var loginCubit = context.read<LoginCubit>();
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 14,
              children: [
                Text(
                  S.of(context).joinNowMessage,
                  style: Theme.of(context).textTheme.titleLarge,
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
                  suffix: loginCubit.suffix,
                  isPassword: loginCubit.isPassword,
                  suffixPressed: loginCubit.changePasswordVisibility,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).passwordValidation;
                    }
                    return null;
                  },
                  onSubmit: (_) {
                    if (formKey.currentState!.validate()) {
                      loginCubit.userLogin(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.rForgetPassScreen);
                    },
                    child: Text(
                      S.of(context).forgetPass,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                CustomTextButton(
                  isLoading: state is LoginLoadingStates,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      loginCubit.userLogin(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                  title: S.of(context).continueText,
                ),
                const CustomDivider(),
                const SocialLoginBody(),
                CustomRegisterLoginButton(
                  text: S.of(context).dontHaveAccount,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.rRegisterScreen);
                  },
                  pressableText: S.of(context).register,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

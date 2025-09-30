import 'package:e_learning/core/widgets/custom_form_field.dart';
import 'package:e_learning/core/widgets/custom_text_button.dart';
import 'package:e_learning/features/auth/presentation/controller/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:e_learning/features/auth/presentation/controller/forget_pass_cubit/forget_pass_state.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgetPassViewBody extends StatefulWidget {
  const ForgetPassViewBody({super.key});

  @override
  State<ForgetPassViewBody> createState() => _ForgetPassViewBodyState();
}

class _ForgetPassViewBodyState extends State<ForgetPassViewBody> {
  final TextEditingController forgetPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    forgetPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassCubit, ForgetPassState>(
      listener: (context, state) {
        if (state is ForgetPassSuccessStates) {
          GoRouter.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text(S.of(context).passwordResetEmail),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var forgetPass = context.read<ForgetPassCubit>();
        return Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 10,
                children: [
                  Text(S.of(context).enterEmailAddress),
                  CustomFormField(
                    controller: forgetPassController,
                    hintText: 'user@example.com',
                    onSubmit: (_) {
                      if (formKey.currentState!.validate()) {
                        forgetPass.changePassword(
                          email: forgetPassController.text,
                        );
                      }
                    },
                    type: TextInputType.emailAddress,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).enterEmailAddress;
                      }
                      return null;
                    },
                  ),
                  CustomTextButton(
                    title: S.of(context).sendLink,
                    isLoading: state is ForgetPassLoadingStates,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        forgetPass.changePassword(
                          email: forgetPassController.text,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

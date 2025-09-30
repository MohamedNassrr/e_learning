import 'package:e_learning/features/auth/presentation/views/widgets/forget_pass_view_body.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).forgetPass,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: const ForgetPassViewBody(),
    );
  }
}

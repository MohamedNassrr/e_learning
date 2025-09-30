import 'package:e_learning/core/utils/assets_data.dart';
import 'package:e_learning/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:e_learning/features/auth/presentation/controller/login_cubit/login_state.dart';
import 'package:e_learning/features/auth/presentation/views/widgets/social_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginBody extends StatelessWidget {
  const SocialLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var loginCubit = context.read<LoginCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            SocialLoginButtons(
              onTap: () {
                loginCubit.googleSignIn();
              },
              iconImage: AssetsData.googleIcon,
            ),
            SocialLoginButtons(
              onTap: () {
                loginCubit.facebookSignIn();
              },
              iconImage: AssetsData.facebookIcon,
            ),
            SocialLoginButtons(
              onTap: () {
                loginCubit.guestLogin();
              },
              iconImage: AssetsData.guestIcon,
            ),
          ],
        );
      },
    );
  }
}

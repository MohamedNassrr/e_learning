import 'package:e_learning/features/auth/presentation/controller/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:e_learning/features/auth/presentation/views/forget_pass_view.dart';
import 'package:e_learning/features/auth/presentation/views/login_view.dart';
import 'package:e_learning/features/auth/presentation/views/register_view.dart';
import 'package:e_learning/features/home/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const rLoginSreen = '/';
  static const rRegisterScreen = '/RegisterView';
  static const rForgetPassScreen = '/ForgetPassView';
  static const rHomeScreen = '/HomeView';

  static final router = GoRouter(
    initialLocation: _initialLocation(),
    routes: [
      GoRoute(
        path: rLoginSreen,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: rRegisterScreen,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: rForgetPassScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => ForgetPassCubit(),
              child: const ForgetPassView(),
            ),
      ),
      GoRoute(path: rHomeScreen, builder: (context, state) => const HomeView()),
    ],
  );
  static String _initialLocation() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null ? rHomeScreen : rLoginSreen;
  }
}

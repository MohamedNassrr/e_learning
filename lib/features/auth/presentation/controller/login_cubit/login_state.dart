sealed class LoginStates {}

final class LoginInitialStates extends LoginStates {}

final class LoginLoadingStates extends LoginStates {}

final class LoginSuccessStates extends LoginStates {}

final class UserLogoutWithGoogleSuccess extends LoginStates {}

final class LoginGoogleSuccessStates extends LoginStates {}

final class UserLogoutWithFacebookSuccess extends LoginStates {}

final class LoginFacebookSuccessStates extends LoginStates {}

final class LoginFacebookFailureStates extends LoginStates {
  final String failure;

  LoginFacebookFailureStates(this.failure);
}

final class LoginGoogleFailureStates extends LoginStates {
  final String failure;

  LoginGoogleFailureStates(this.failure);
}

final class ChangePasswordVisibilityStates extends LoginStates {}

final class LoginFailureStates extends LoginStates {
  final String failure;

  LoginFailureStates(this.failure);
}

final class LoginGuestModeSuccessStates extends LoginStates {}

final class LoginGuestModeFailureStates extends LoginStates {
  final String failure;

  LoginGuestModeFailureStates(this.failure);
}

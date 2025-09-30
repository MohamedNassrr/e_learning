sealed class RegisterStates {}

final class RegisterInitialState extends RegisterStates {}

final class RegisterLoadingState extends RegisterStates {}

final class RegisterSuccessState extends RegisterStates {}

final class CreateUserSuccessState extends RegisterStates {}

final class CreateUserFailureState extends RegisterStates {
  final String failure;

  CreateUserFailureState(this.failure);
}

final class RegisterFailureState extends RegisterStates {
  final String failure;

  RegisterFailureState(this.failure);
}

final class ChangePasswordVisibilityStates extends RegisterStates {}

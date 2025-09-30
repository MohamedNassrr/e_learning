sealed class ForgetPassState {}

final class ForgetPassInitialStates extends ForgetPassState {}

final class ForgetPassLoadingStates extends ForgetPassState {}

final class ForgetPassSuccessStates extends ForgetPassState {}

final class ForgetPassFailureStates extends ForgetPassState {
  final String failure;

  ForgetPassFailureStates(this.failure);
}

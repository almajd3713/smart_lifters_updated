part of 'user_bloc.dart';

@immutable
sealed class UserEvent {
  const UserEvent();
}

class LoginEvent extends UserEvent {
  final String name;
  final String password;

  const LoginEvent(this.name, this.password);
}

class SignupEvent extends UserEvent {
  final String name;
  final String email;
  final String password;

  const SignupEvent(this.name, this.email, this.password);

  List<Object> get props => [name, email, password];
}

class LogoutEvent extends UserEvent {
  List<Object> get props => [];
}

class UpdateOnboardingDataEvent extends UserEvent {
  final String field;
  final dynamic value;

  const UpdateOnboardingDataEvent(this.field, this.value);

  List<Object> get props => [field, value];
}

class CompleteOnboardingEvent extends UserEvent {
}

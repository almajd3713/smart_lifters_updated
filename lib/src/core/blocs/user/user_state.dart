part of 'user_bloc.dart';

@immutable
abstract class UserState {
  const UserState({required this.props});
  final Map<String, Object> props;
}

class UserInitial extends UserState {
  const UserInitial({required super.props});
}

class UserLoading extends UserState {
  const UserLoading({required super.props});
}

class UserAuthenticated extends UserState {
  final User user;

  const UserAuthenticated({required this.user, required super.props});
}

class UserUnauthenticated extends UserState {
  const UserUnauthenticated({required super.props});
}

class UserError extends UserState {
  final String message;

  const UserError({required this.message, required super.props});
}

class UserBoarding extends UserState {
  const UserBoarding({required super.props});
}

class UserNotLoggedIn extends UserState {
  const UserNotLoggedIn({required super.props});
}
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AppLogoutRequested extends AuthenticationEvent {
  const AppLogoutRequested();
}

class _AppUserChanged extends AuthenticationEvent {
  const _AppUserChanged(this.user);

  final User user;
}

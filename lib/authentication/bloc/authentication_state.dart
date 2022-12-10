part of 'authentication_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  inProgress,
}

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    required this.status,
    this.user = User.empty,
  });

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  final AuthStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}

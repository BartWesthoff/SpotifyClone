part of 'authentication_bloc.dart';

class AuthenticationState {
  AuthenticationState._({
    required this.status,
    this.user = User.empty,
  });

  AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  User user;
  //
  // @override
  // List<Object> get props => [status, user];
}

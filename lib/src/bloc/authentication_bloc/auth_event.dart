abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final bool isCheckRemember;
  LoginEvent({
    required this.email,
    required this.password,
    required this.isCheckRemember,
  });
}

class OnAuthCheck extends AuthenticationEvent {}

class LogOutEvent extends AuthenticationEvent {}

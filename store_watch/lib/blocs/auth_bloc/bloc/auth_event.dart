part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent(this.name, this.email, this.password);

}
final class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  LogInEvent(this.email, this.password);

}

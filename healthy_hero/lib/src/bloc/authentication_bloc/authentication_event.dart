import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// tres eventos
// app started
// LoggedIn
// LoggedOut

class AppStarted extends AuthenticationEvent{}

class LoggedIn extends AuthenticationEvent{}

class LoggedOut extends AuthenticationEvent{}
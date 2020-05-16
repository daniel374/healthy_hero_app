import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  
  LogintEvent();

  @override
  List<Object> get props => [];

}

// cinco eventos
// email changed
abstract class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged {email: $email}';
}
// password change
abstract class PasswordChanged extends LoginEvent{
  final String password;

  PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged {password: $password}';

}
// submitted
abstract class Submitted extends LoginEvent{
  final String email;
  final String password;

  Submitted({@required this.email, this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'Submitted{email: $email, password: $password}';

}
// LoginWithGooglePressed
abstract class LoginWithGooglePressed extends LoginEvent {}
// LoginWithCredentialsPressed
abstract class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentialsPressed(
    {@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'LoginWithCredentials {email: $email, password: $password}';
}
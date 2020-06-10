import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

// Tres estados
// No inicializado -> splash screen
// autenticado -> home
// No autenticado -> Login

class Uninitialized extends AuthenticationState{
  @override
  String toString() => 'No Inicializado';
}

class Authenticated extends AuthenticationState {
  final String displayName;

  const Authenticated(this.displayName);
  
  @override
  // TODO: implement props
  List<Object> get props => [displayName];

  @override
  String toString() => 'Authenticado - displayName :$displayName';

}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'No autenticado';
}
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}
//In this specific code snippet, AuthState is an abstract class representing the different states of an authentication process. The AuthInitial class is a subclass of AuthState representing the initial state of the authentication process.
//By extending Equatable, you get a more concise and less error-prone way to implement the equality comparison and hash code generation methods. Without using equatable, you would need to manually override the == operator and hashCode method, taking into account all the properties of the class.
//Using Equatable, you only need to implement the props getter which returns a list of objects that are used to determine whether two instances of the class are equal or not. The Equatable package takes care of comparing these lists of properties and generating hash codes accordingly. This helps in reducing the amount of boilerplate code and potential errors.


class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final String uid;

   Authenticated({required this.uid});

  @override
  List<Object> get props => [uid];
}
class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}


import 'package:equatable/equatable.dart';
import 'package:smart_plantation/common/user/user.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticatedState extends AuthState {
  AuthenticatedState({required User user});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UnAuthenticatedState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

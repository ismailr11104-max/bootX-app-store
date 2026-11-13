import 'package:bootx_app/features/auth/domain/entity/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity user;

  const SignInSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class SignInError extends SignInState {
  final String message;

  const SignInError(this.message);

  @override
  List<Object?> get props => [message];
}

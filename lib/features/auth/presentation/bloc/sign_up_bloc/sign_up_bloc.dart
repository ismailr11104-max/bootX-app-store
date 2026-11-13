import 'dart:async';

import 'package:bootx_app/features/auth/domain/repo/sign_up_repository.dart';
import 'package:bootx_app/features/auth/presentation/bloc/sign_up_bloc/sign_up_event.dart';
import 'package:bootx_app/features/auth/presentation/bloc/sign_up_bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository _repository;

  SignUpBloc({required this._repository}) : super(SignUpInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());

    final result = await _repository.signUp(
      name: event.name,
      email: event.email,
      password: event.password,
      phone: event.phone,
    );

    result.fold(
      (failure) => emit(SignUpError(failure.message)),
      (user) => emit(SignUpSuccess(user)),
    );
  }
}

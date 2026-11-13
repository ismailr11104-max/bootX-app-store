import 'package:bootx_app/features/auth/domain/repo/sign_in_repository.dart';
import 'package:bootx_app/features/auth/presentation/bloc/sign_in_bloc/sign_in_event.dart';
import 'package:bootx_app/features/auth/presentation/bloc/sign_in_bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository _signInRepository;

  SignInBloc(this._signInRepository) : super(SignInInitial()) {
    on<SignInRequested>(_onSignInRequested);
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInLoading());

    final result = await _signInRepository.signIn(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(SignInError(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }
}

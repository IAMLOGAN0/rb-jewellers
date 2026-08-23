import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/i_auth_facade.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade authFacade;

  AuthBloc({required this.authFacade}) : super(const AuthState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      final userOption = await authFacade.getSignedInUser();
      userOption.fold(
        () => emit(const AuthState.unauthenticated()),
        (u) => emit(const AuthState.authenticated()),
      );
    });

    on<SignedOut>((event, emit) async {
      await authFacade.signOut();
      emit(const AuthState.unauthenticated());
    });
  }
}

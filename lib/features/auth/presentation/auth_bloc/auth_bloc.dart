import 'dart:developer';

import 'package:ashafaq/config/network/tokens/impl/tokens_repo.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/auth/data/exceptions/auth_exceptions.dart';
import 'package:ashafaq/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepoImpl _authRepo;
  final TokensRepo _tokensRepo;
  AuthBloc(this._authRepo, this._tokensRepo) : super(const AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(const AuthLoadingState());
      try {
        log('login bloc: start: ${event.otp}');
        final user = await _authRepo.login(event.phoneNumber, event.otp);
        log('login bloc: user:${user.user}');
        await Future.wait([_tokensRepo.storeAccessToken(user.token)]);
        emit(const LogInSuccessState());
      } on AuthException catch (e) {
        log('login bloc: auth exception: ${e.errors}');
        final errors = e.errors;
        emit(
          LoginErrorState(
            phoneNumberError: errors?[JsonKeys.phone]?[0],
            otpError: errors?[JsonKeys.otp]?[0],
            generalError: e.message,
          ),
        );
      } catch (e) {
        log('login bloc: general exception: ${e.toString()}');
        emit(LoginErrorState(generalError: e.toString()));
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(const AuthLoadingState());
      try {
        log('register bloc: start');
        await _authRepo.register(
          phoneNumber: event.phoneNumber,
          email: event.email,
          name: event.name,
          referCode: event.referCode,
        );

        emit(const RegisterSuccessState());
      } on AuthException catch (e) {
        final errors = e.errors;
        log('register bloc: auth exception:${e.errors}');
        emit(
          RegisterErrorState(
            phoneNumberError: errors?[JsonKeys.phone]?[0],
            emailError: errors?[JsonKeys.email]?[0],
            nameError: errors?[JsonKeys.name]?[0],
            generalError: e.message,
          ),
        );
      } catch (e) {
        log('register bloc: unknown exception:${e.toString()}');
        emit(RegisterErrorState(generalError: e.toString()));
      }
    });
  }
}

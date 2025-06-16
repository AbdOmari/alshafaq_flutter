import 'dart:developer';
import 'package:ashafaq/config/network/tokens/impl/tokens_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserModeCubit extends Cubit<UserMode> {
  final TokensRepo _tokensRepo;
  UserModeCubit(this._tokensRepo) : super(UserMode.initial);
  Future isLoggedIn() async {
    final accessToken = await _tokensRepo.fetchAccessToken();
    log('access token: $accessToken');

    if (accessToken != null) {
      emit(UserMode.authenticated);
      return;
    }
    emit(UserMode.guest);
  }
}

enum UserMode { initial, authenticated, guest, unauthenticated }

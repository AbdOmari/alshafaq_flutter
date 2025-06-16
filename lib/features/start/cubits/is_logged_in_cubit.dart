import 'dart:developer';

import 'package:ashafaq/config/network/tokens/impl/tokens_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsLoggedInCubit extends Cubit<bool?> {
  final TokensRepo _tokensRepo;
  IsLoggedInCubit(this._tokensRepo) : super(false);
  Future isLoggedIn() async {
    final accessToken = await _tokensRepo.fetchAccessToken();
    log('access token: $accessToken');
    emit(accessToken != null);
  }
}

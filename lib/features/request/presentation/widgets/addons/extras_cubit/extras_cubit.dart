import 'dart:developer';

import 'package:ashafaq/features/request/data/repo_impl/addons_repo_impl.dart';
import 'package:ashafaq/features/request/domain/entities/order_extra.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExtrasCubit extends Cubit<List<OrderExtra>> {
  final AddonsRepoImpl _addonsRepoImpl;
  ExtrasCubit(this._addonsRepoImpl) : super([]);
  List<OrderExtra> extras = [];
  void getExtras() async {
    log('extras: $extras');
    if (extras.isNotEmpty) {
      emit(extras);
      return;
    }
    final response = await _addonsRepoImpl.getExtras();
    if (response != null) extras = response;

    emit(extras);
  }
}

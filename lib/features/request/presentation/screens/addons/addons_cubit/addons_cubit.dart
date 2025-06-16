import 'dart:developer';

import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/features/request/data/repo_impl/addons_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'addons_state.dart';

class AddonsCubit extends Cubit<AddonsState> {
  final AddonsRepoImpl _addonsRepoImpl;
  AddonsCubit(this._addonsRepoImpl) : super(const AddonsInitial());

  void getAddons() async {
    try {
      log('addons: start get addons');
      await _addonsRepoImpl.getAddons();
      emit(const FetchAddonsSuccessState());
    } on BaseException catch (e) {
      log('addons init: baseError: ${e.message} ');
      emit(AddonsFailureState(e.message));
    } catch (e) {
      log('addons init: general error: ${e.toString()} ');
      emit(AddonsFailureState(e.toString()));
    }
  }
}

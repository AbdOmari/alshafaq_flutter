import 'dart:developer';

import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/config/exceptions/network_exception.dart';
import 'package:ashafaq/features/home/data/models/normal_package.dart';
import 'package:ashafaq/features/home/data/repo_impl/package_repo_impl.dart';
import 'package:ashafaq/features/home/domain/i_repo/i_package_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_packages_state.dart';

class PopularPackagesCubit extends Cubit<PopularPackagesState>
    implements IPackageCubit {
  PopularPackagesCubit(this._packagesRepo)
    : super(const PopularPackageInitialState());
  final PackagesRepoImpl _packagesRepo;
  @override
  void getPackages() async {
    try {
      emit(const PopularPackageLoadingState());
      final packages = await _packagesRepo.getNormalPackages();
      if (packages.isEmpty) {
        emit(const NoPackagesState());
        return;
      }
      emit(GotPopularPackageState(packages));
    } on BaseException catch (e) {
      emit(PopularPackageFailureState(e.message ?? ''));
    } on NetworkException catch (e) {
      log('network error message ${e.toString()}');
      emit(PopularPackageFailureState(e.message));
    } catch (e) {
      emit(PopularPackageFailureState(e.toString()));
    }
  }
}

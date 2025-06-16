import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/features/home/data/models/saving_package.dart';
import 'package:ashafaq/features/home/data/repo_impl/package_repo_impl.dart';
import 'package:ashafaq/features/home/domain/i_repo/i_package_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'saving_packages_state.dart';

class SavingPackagesCubit extends Cubit<SavingPackagesState>
    implements IPackageCubit {
  SavingPackagesCubit(this._packagesRepo)
    : super(const SavingPackagesInitialState());
  final PackagesRepoImpl _packagesRepo;
  @override
  void getPackages() async {
    try {
      emit(const SavingPackagesLoadingState());
      final packages = await _packagesRepo.getSavingPackages();
      if (packages.isEmpty) {
        emit(const NoPackagesState());
        return;
      }
      emit(GotSavingPackagesState(packages));
    } on BaseException catch (e) {
      emit(SavingPackagesFailureState(e.message ?? ''));
    } catch (e) {
      emit(SavingPackagesFailureState(e.toString()));
    }
  }
}

import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/features/home/data/repo_impl/package_repo_impl.dart';
import 'package:ashafaq/features/home/domain/entities/packages/package.dart';
import 'package:ashafaq/features/home/domain/i_repo/i_package_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_packages_state.dart';

class AllPackagesCubit extends Cubit<AllPackagesState>
    implements IPackageCubit {
  AllPackagesCubit(this._packagesRepo) : super(const AllPackagesInitialState());
  final PackagesRepoImpl _packagesRepo;
  @override
  void getPackages() {
    emit(const AllPackagesLoadingState());
    try {
      final allPackages = _packagesRepo.getAllPackages();
      if (allPackages.isEmpty) {
        emit(const NoPackagesState());
        return;
      }
      emit(GotAllPackagesState(allPackages));
    } on BaseException catch (e) {
      emit(AllPackagesFailureState(e.message ?? ''));
    } catch (e) {
      emit(AllPackagesFailureState(e.toString()));
    }
  }
}

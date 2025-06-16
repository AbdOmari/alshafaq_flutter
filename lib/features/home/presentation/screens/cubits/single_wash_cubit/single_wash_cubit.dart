import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/features/home/data/models/single_wash_package.dart';
import 'package:ashafaq/features/home/data/repo_impl/package_repo_impl.dart';
import 'package:ashafaq/features/home/domain/i_repo/i_package_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_wash_state.dart';

class SingleWashCubit extends Cubit<SingleWashState> implements IPackageCubit {
  SingleWashCubit(this._packagesRepo) : super(const SingleWashInitialState());
  final PackagesRepoImpl _packagesRepo;
  @override
  void getPackages() async {
    try {
      emit(const SingleWashLoadingState());
      final package = await _packagesRepo.getSingleWashPackage();
      if (package == null) {
        emit(const NoPackageState());
        return;
      }
      emit(GotSingleWashState(package));
    } on BaseException catch (e) {
      emit(SingleWashFailureState(e.message ?? ''));
    } catch (e) {
      emit(SingleWashFailureState(e.toString()));
    }
  }
}

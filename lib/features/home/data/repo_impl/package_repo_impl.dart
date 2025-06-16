import 'package:ashafaq/features/home/data/models/normal_package.dart';
import 'package:ashafaq/features/home/data/models/saving_package.dart';
import 'package:ashafaq/features/home/data/models/single_wash_package.dart';
import 'package:ashafaq/features/home/data/services_impl/packages_service_impl.dart';
import 'package:ashafaq/features/home/domain/entities/packages/package.dart';
import 'package:ashafaq/features/home/domain/i_repo/i_package_repo.dart';

final class PackagesRepoImpl implements IPackagesRepo {
  final PackagesServiceImpl _packagesService;
  PackagesRepoImpl(this._packagesService);
  final List<SavingPackage> _savingPackages = [];
  final List<NormalPackage> _normalPackages = [];

  //?this will return List<SavingPackage>
  @override
  Future<List<SavingPackage>> getSavingPackages() async {
    _savingPackages.clear();
    final result = await _packagesService.getSavingPackages();
    if (result.isSucceed) {
      _savingPackages.addAll(result.savingPackages);
      return result.savingPackages;
    }
    throw result.exceptions!;
  }

  //?this will return SinglePackage
  @override
  Future<SinglePackage?> getSingleWashPackage() async {
    final result = await _packagesService.getSingleWashPackage();
    if (result.isSucceed) {
      if (result.singlePackages.isEmpty) return null;
      return result.singlePackages.first;
    }
    throw result.exceptions!;
  }

  //?this will return List<NormalPackage>
  @override
  Future<List<NormalPackage>> getNormalPackages() async {
    _normalPackages.clear();
    final result = await _packagesService.getNormalPackages();
    if (result.isSucceed) {
      _normalPackages.addAll(result.normalPackages);
      return result.normalPackages;
    }
    throw result.exceptions!;
  }

  //?this will return List<Package>
  @override
  List<Package> getAllPackages() => [..._savingPackages, ..._normalPackages];
}

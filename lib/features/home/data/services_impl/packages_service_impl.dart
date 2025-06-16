import 'dart:developer';

import 'package:ashafaq/config/helpers/dio_helper.dart';
import 'package:ashafaq/core/request/endpoints.dart';
import 'package:ashafaq/features/home/data/responses/normal_package_response.dart';
import 'package:ashafaq/features/home/data/responses/saving_package_response.dart';
import 'package:ashafaq/features/home/data/responses/single_package_response.dart';
import 'package:ashafaq/features/home/domain/i_services/i_package_service.dart';

final class PackagesServiceImpl implements IPackageService {
  final DioHelper _dioHelper;
  const PackagesServiceImpl(this._dioHelper);

  @override
  Future<SavingPackageResponse> getSavingPackages() async {
    log('saving response: start');
    final response = await _dioHelper.get(
      PackagesUrls.saving,
      headers: _dioHelper.requestHeaders.headers,
    );

    log('saving response: $response');
    return SavingPackageResponse.init(response);
  }

  @override
  Future<SinglePackageResponse> getSingleWashPackage() async {
    final response = await _dioHelper.get(
      PackagesUrls.single,
      headers: _dioHelper.requestHeaders.headers,
    );
    return SinglePackageResponse.init(response);
  }

  @override
  Future<NormalPackageResponse> getNormalPackages() async {
    final response = await _dioHelper.get(
      PackagesUrls.package5,
      headers: _dioHelper.requestHeaders.headers,
    );
    return NormalPackageResponse.init(response);
  }

  @override
  getAllPackages() {
    // TODO: implement getAllPackages
    throw UnimplementedError();
  }
}

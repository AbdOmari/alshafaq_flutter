import 'dart:developer';

import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/home/data/models/saving_package.dart';
import 'package:ashafaq/features/home/data/responses/packages_response.dart';

final class SavingPackageResponse extends PackagesResponse {
  late final List<SavingPackage> savingPackages;
  SavingPackageResponse.init(super.dioResponse) : super.init() {
    final resData = super.dioResponse.data;
    if (isSucceed) {
      //?this will be done later but now we will just return the list we
      //?already create
      final data = resData[JsonKeys.data];
      log('response data: $data');
      savingPackages = SavingPackage.fromJsonList(data[JsonKeys.items]);
    }
  }
}

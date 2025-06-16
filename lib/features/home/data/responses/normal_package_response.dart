import 'dart:developer';

import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/home/data/models/normal_package.dart';
import 'package:ashafaq/features/home/data/responses/packages_response.dart';

final class NormalPackageResponse extends PackagesResponse {
  late final List<NormalPackage> normalPackages;
  NormalPackageResponse.init(super.dioResponse) : super.init() {
    final resData = super.dioResponse.data;
    if (isSucceed) {
      //?this will be done later but now we will just return the list we
      //?already create
      final data = resData[JsonKeys.data];
      log('response data: $data');
      normalPackages = NormalPackage.fromJsonList(data);
    }
  }
}

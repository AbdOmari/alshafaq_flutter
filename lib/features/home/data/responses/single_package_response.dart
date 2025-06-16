import 'dart:developer';

import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/home/data/models/single_wash_package.dart';
import 'package:ashafaq/features/home/data/responses/packages_response.dart';

final class SinglePackageResponse extends PackagesResponse {
  late final List<SinglePackage> singlePackages;
  SinglePackageResponse.init(super.dioResponse) : super.init() {
    final resData = super.dioResponse.data;
    if (isSucceed) {
      //?this will be done later but now we will just return the list we
      //?already create
      final data = resData[JsonKeys.data];
      log('response data: $data');
      singlePackages = SinglePackage.fromJsonList(data);
    }
  }
}

import 'dart:developer';

import 'package:ashafaq/config/helpers/dio_helper.dart';
import 'package:ashafaq/core/request/endpoints.dart';
import 'package:ashafaq/features/request/data/responses/addons_response.dart';
import 'package:ashafaq/features/request/domain/i_services/i_addons_service.dart';

final class AddonsServiceImpl implements IAddonsService {
  final DioHelper _dioHelper;
  const AddonsServiceImpl(this._dioHelper);
  @override
  Future<AddonsResponse> getAddons(String token) async {
    log('addons: service start');
    final result = await _dioHelper.get(
      addonsEndPoint,
      headers: _dioHelper.requestHeaders.getHeaders(token),
    );
    log('addons: service body: ${result.data}');
    return AddonsResponse.init(result);
  }
}

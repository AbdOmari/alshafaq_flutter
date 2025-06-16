import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/config/response/base_response.dart';
import 'package:ashafaq/config/response/i_response.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/request/data/models/addons/order_extra/m_order_extra/m_order_extra.dart';
import 'package:ashafaq/features/request/data/models/addons/order_services/m_order_service.dart';
import 'package:ashafaq/features/request/domain/entities/order_extra.dart';
import 'package:ashafaq/features/request/domain/entities/order_service.dart';
import 'package:dio/dio.dart';

final class AddonsResponse implements IResponse {
  late final BaseResponse _baseResponse;
  late final Response _dioResponse;
  late final List<OrderExtra> extras;
  late final List<OrderService> services;
  AddonsResponse.init(this._dioResponse) {
    final resData = _dioResponse.data;
    _baseResponse = BaseResponse(
      _dioResponse.statusCode!,
      isSucceed: resData[JsonKeys.success],
      exception: BaseException(_dioResponse),
    );
    if (isSucceed) {
      //?this will be done later but now we will just return the list we
      //?already create
      final data = resData[JsonKeys.data];
      extras = MOrderExtra.toEntity(data[JsonKeys.orderExtras]);
      services = MOrderService.toEntity(data[JsonKeys.orderService]);
    }
  }
  @override
  BaseException? get exceptions => _baseResponse.exception;

  @override
  bool get isSucceed => _baseResponse.isSucceed;

  @override
  int get statusCode => _baseResponse.statusCode;
}

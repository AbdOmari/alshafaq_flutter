import 'package:ashafaq/config/response/general_response.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/home/data/models/m_banner.dart';
import 'package:ashafaq/features/home/domain/entities/i_banner.dart';

final class BannersResponse extends GeneralResponse {
  late final List<IBanner> banners;
  BannersResponse.init(super.dioResponse) : super.init() {
    if (super.isSucceed) {
      banners = MBanner.fromJsonList(super.resData[JsonKeys.data]);
    }
  }
}

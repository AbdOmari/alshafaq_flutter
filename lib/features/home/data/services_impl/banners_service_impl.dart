import 'package:ashafaq/config/helpers/dio_helper.dart';
import 'package:ashafaq/core/request/endpoints.dart';
import 'package:ashafaq/features/home/data/responses/banners_response.dart';
import 'package:ashafaq/features/home/domain/i_repo/i_banners_repo.dart';

final class BannersServiceImpl implements IBannersRepo {
  final DioHelper _dioHelper;
  const BannersServiceImpl(this._dioHelper);
  @override
  Future<BannersResponse> getBanners() async => BannersResponse.init(
    await _dioHelper.get(
      CatalogUrls.banners,
      headers: _dioHelper.requestHeaders.headers,
    ),
  );
}

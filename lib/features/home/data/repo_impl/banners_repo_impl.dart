import 'package:ashafaq/features/home/data/services_impl/banners_service_impl.dart';
import 'package:ashafaq/features/home/domain/entities/i_banner.dart';
import 'package:ashafaq/features/home/domain/i_repo/i_banners_repo.dart';

final class BannersRepoImpl implements IBannersRepo {
  final BannersServiceImpl _bannersService;
  const BannersRepoImpl(this._bannersService);
  @override
  Future<List<IBanner>> getBanners() async {
    final result = await _bannersService.getBanners();
    if (result.isSucceed) {
      return result.banners;
    }
    throw result.exceptions!;
  }
}

import 'package:ashafaq/config/network/tokens/impl/tokens_repo.dart';
import 'package:ashafaq/features/request/data/services_impl/addons_service_impl.dart';
import 'package:ashafaq/features/request/domain/entities/order_extra.dart';
import 'package:ashafaq/features/request/domain/entities/order_service.dart';
import 'package:ashafaq/features/request/domain/i_repo/i_addons_repo.dart';

final class AddonsRepoImpl implements IAddonsRepo {
  final AddonsServiceImpl _addonsServiceImpl;
  final TokensRepo _tokensRepo;
  AddonsRepoImpl(this._addonsServiceImpl, this._tokensRepo);

  late List<OrderExtra>? _extras;
  late List<OrderService>? _services;

  @override
  Future<List<OrderExtra>?> getExtras() async {
    if (_extras != null) return _extras;
    await getAddons();
    return _extras!;
  }

  @override
  Future<List<OrderService>?> getServices() async {
    if (_services != null) return _services;
    await getAddons();
    return _services!;
  }

  @override
  Future getAddons() async {
    final token = await _tokensRepo.fetchAccessToken();
    final result = await _addonsServiceImpl.getAddons(token!);
    if (result.isSucceed) {
      //?now the request works perfectly and we now can get the extras and service
      _extras = result.extras;
      _services = result.services;
      return;
    }
    throw result.exceptions!;
  }

  void dispose() {
    _extras = null;
    _services = null;
  }
}

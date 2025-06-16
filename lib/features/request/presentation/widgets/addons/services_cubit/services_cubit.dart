import 'package:ashafaq/features/request/data/repo_impl/addons_repo_impl.dart';
import 'package:ashafaq/features/request/domain/entities/order_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesCubit extends Cubit<List<OrderService>> {
  final AddonsRepoImpl _addonsRepoImpl;
  ServicesCubit(this._addonsRepoImpl) : super([]);
  List<OrderService> services = [];
  void getServices() async {
    if (services.isNotEmpty) {
      emit(services);
      return;
    }
    final response = await _addonsRepoImpl.getServices();
    if (response != null) services = response;

    emit(services);
  }
}

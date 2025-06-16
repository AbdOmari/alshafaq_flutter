import 'package:ashafaq/features/home/domain/entities/wash_service/service_info.dart';
import 'package:equatable/equatable.dart';

class WashService extends Equatable {
  final ServiceInfo _info;
  const WashService({required ServiceInfo info}) : _info = info;
  String get name => _info.name;
  String get image => _info.image;

  @override
  List<Object?> get props => [_info];
}

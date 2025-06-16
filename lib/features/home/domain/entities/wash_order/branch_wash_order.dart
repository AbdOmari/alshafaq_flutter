import 'package:ashafaq/features/home/domain/entities/branch.dart';
import 'package:ashafaq/features/home/domain/entities/wash_order/wash_order.dart';

final class BranchWashOrder extends WashOrder {
  final Branch branch;
  BranchWashOrder({
    required super.package,
    required super.car,
    required this.branch,
    required super.orderDateTime,
  });
  @override
  List<Object?> get props => [...super.props, branch];
}

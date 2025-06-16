import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/domain/entities/packages/package.dart';
import 'package:ashafaq/features/home/data/models/single_wash_package.dart';
import 'package:ashafaq/features/home/presentation/widgets/package/single_wash_package_card.dart';
import 'package:flutter/material.dart';

class RequestSinglePackageCard extends StatelessWidget {
  const RequestSinglePackageCard({
    super.key,
    required this.package,
    required this.d,
  });
  final Package package;
  final Dimensions d;
  @override
  Widget build(BuildContext context) {
    return SingleWashPackageCard(
      package: package as SinglePackage,
      d: d,
      onTap: null,
    );
  }
}

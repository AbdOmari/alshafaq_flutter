import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/features/home/domain/entities/wash_service/service_info.dart';
import 'package:ashafaq/features/home/domain/entities/wash_service/wash_service.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

List<WashService> servicesList(BuildContext context) {
  final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
  return [
    WashService(
      info: ServiceInfo(
        name: appLocalizations.homeService,
        image: ImageManger.homeService,
      ),
    ),
    WashService(
      info: ServiceInfo(
        name: appLocalizations.branch,
        image: ImageManger.branch,
      ),
    ),
    WashService(
      info: ServiceInfo(
        name: appLocalizations.coporateFleet,
        image: ImageManger.coporateFleet,
      ),
    ),
  ];
}

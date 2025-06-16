import 'package:ashafaq/core/util/validators/form_validator.dart';
import 'package:ashafaq/core/util/validators/name_validator.dart';
import 'package:ashafaq/features/locations/data/models/m_location.dart';
import 'package:ashafaq/features/locations/data/models/zones/m_zone.dart';
import 'package:ashafaq/features/locations/domain/entities/i_zone.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final class LocationValidator {
   IZone? zone;
   String? name;
   LatLng? latLng;
   String?notes;
  final formValidator = FormValidator();
  final nameValidator = NameValidator();
  final zoneValidator = NameValidator();
  final locationValidator = NameValidator();
  String? validate(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    if (zone == null) {
      return appLocalizations.canNotEmpty(appLocalizations.zone);
    }
    if (latLng == null) {
      return appLocalizations.pleaseSelect(appLocalizations.location);
    }
    return null;
  }

  MLocation create() {
    return MLocation(
      id: 0,
      name: name!,
      notes: notes,
      latitude: '${latLng!.latitude}',
      longitude: '${latLng!.longitude}',
      zone: MZone(zone!.id, zone!.name, zone!.iCoordinates),
    );
  }
}

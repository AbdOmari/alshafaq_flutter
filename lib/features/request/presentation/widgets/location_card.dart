import 'package:ashafaq/config/shared/buttons/custom_icon_button.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.appLocalizations,
    required this.location,
    required this.onPressed,
  });

  final AppLocalizations appLocalizations;
  final String? location;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Container(
        color: Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.location_on_outlined),
          title: Text(appLocalizations.currentLocation),
          subtitle: Text(location == null ? '' : location!),
          trailing:
              onPressed == null
                  ? null
                  : CustomIconButton(icon: Icons.edit, onPressed: onPressed),
        ),
      ),
    );
  }
}

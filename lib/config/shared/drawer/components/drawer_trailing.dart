import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/drawer/components/divider.dart';
import 'package:ashafaq/config/shared/drawer/components/drawer_item.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class DrawerTrailing extends StatelessWidget {
  const DrawerTrailing({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        const DrawerDivider(),

        DrawerItem(
          imagePath: ImageManger.delete,
          showTrailing: false,
          iconBackgroundColor: const Color(0xffFFEEEE),
          label: appLocalizations.deleteAccount,
          onTap: () {},
        ),
        DrawerItem(
          imagePath: ImageManger.logout,
          label: appLocalizations.logIn,
          showTrailing: false,
          iconBackgroundColor: const Color(0xffFFEEEE),
          onTap: () {},
        ),
      ],
    );
  }
}

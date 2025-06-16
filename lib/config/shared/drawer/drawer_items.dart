import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/features/app/about_us/about_us_screen.dart';
import 'package:ashafaq/features/app/contact_us/contact_us_screen.dart';
import 'package:ashafaq/features/app/privacy_policy/privacy_policy_screen.dart';
import 'package:ashafaq/features/app/terms_and_conditions/terms_and_conditions_screen.dart';
import 'package:ashafaq/features/cars/presentation/screens/cars_screen.dart';
import 'package:ashafaq/features/gifts/presentation/screens/gifts_screen.dart';
import 'package:ashafaq/features/locations/presentation/screens/locations_screen.dart';
import 'package:ashafaq/features/settings/presentation/screens/settings_screen.dart';
import 'package:ashafaq/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

final class DrawerObj {
  final String iconPath;
  final String label;
  final String location;
  const DrawerObj(this.iconPath, this.label, this.location);
}

List<DrawerObj> getDrawerItems(BuildContext context) {
  final appLocalizations = AppLocalizations.of(context)!;
  return [
    DrawerObj(
      ImageManger.subscriptionsIcon,
      appLocalizations.userWallet,
      WalletScreen.pageRoute,
    ),
    DrawerObj(
      ImageManger.cars,
      appLocalizations.userCars,
      CarsScreen.pageRoute,
    ),
    DrawerObj(
      ImageManger.location,
      appLocalizations.locations,
      LocationsScreen.pageRoute,
    ),
    DrawerObj(ImageManger.gifts, appLocalizations.gifts, GiftsScreen.pageRoute),
    DrawerObj(
      ImageManger.contactUs,
      appLocalizations.contactUs,
      ContactUsScreen.pageRoute,
    ),
    DrawerObj(
      ImageManger.settings,
      appLocalizations.settings,
      SettingsScreen.pageRoute,
    ),
    DrawerObj(
      ImageManger.aboutUs,
      appLocalizations.aboutUs,
      AboutUsScreen.pageRoute,
    ),
    DrawerObj(
      ImageManger.privacyPolicy,
      appLocalizations.privacyPolicy,
      PrivacyPolicyScreen.pageRoute,
    ),
    DrawerObj(
      ImageManger.termsAndConditions,
      appLocalizations.termsAndConditions,
      TermsAndConditionsScreen.pageRoute,
    ),
  ];
}

import 'package:ashafaq/core/keys/shared_preferences_keys.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

final class TextDirectionHandler {
  static TextDirection getDirection(BuildContext context) {
    final localName = AppLocalizations.of(context)!.localeName;
    if (localName == SupportedLangCode.arabicCode) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }
}

import 'package:ashafaq/core/keys/shared_preferences_keys.dart';
import 'package:flutter/material.dart';


TextDirection appTextDirection(String local) {
  if (local == SupportedLangCode.arabicCode) {
    return TextDirection.rtl;
  }
  return TextDirection.ltr;
}

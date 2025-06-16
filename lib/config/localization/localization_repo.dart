import 'package:ashafaq/config/localization/localization_service.dart';
import 'package:ashafaq/core/keys/shared_preferences_keys.dart';

final class LocalizationRepo {
  final _localizationService = LocalizationService();
  Future<bool> setLang(String langCode) async =>
      await _localizationService.setLang(langCode);

  Future<bool> setEnLang() async =>
      await _localizationService.setLang(SupportedLangCode.englishCode);

  Future<bool> setArLang() async =>
      await _localizationService.setLang(SupportedLangCode.arabicCode);

  Future<bool> setFrLang() async =>
      await _localizationService.setLang(SupportedLangCode.frenchCode);

  Future<String?> getLang() async => await _localizationService.getLang();
}

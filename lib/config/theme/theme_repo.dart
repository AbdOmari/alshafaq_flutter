import 'package:ashafaq/config/theme/theme_service.dart';

final class ThemeRepo {
  final _themeService = ThemeService();
  Future setLightTheme() async => await _themeService.setTheme(isDark: false);

  Future setDarkTheme() async => await _themeService.setTheme(isDark: true);

  Future setTheme({required bool isDark}) async =>
      await _themeService.setTheme(isDark: isDark);

  Future<bool> isDark() async => await _themeService.isDark();
}

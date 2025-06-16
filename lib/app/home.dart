import 'package:ashafaq/config/localization/localization_cubit.dart';
import 'package:ashafaq/config/router/app_router.dart';
import 'package:ashafaq/config/theme/app_theme.dart';
import 'package:ashafaq/config/theme/theme_cubit.dart';
import 'package:ashafaq/core/keys/shared_preferences_keys.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalizationCubit()..getLocalization(),
        ),
        BlocProvider(create: (context) => ThemeCubit()..isDarkTheme()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDark) {
          return BlocBuilder<LocalizationCubit, String?>(
            builder: (context, langCode) {
              return MaterialApp.router(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale(langCode ?? SupportedLangCode.englishCode),
                theme: getTheme(isDark),
                routerConfig: router,
              );
            },
          );
        },
      ),
    );
  }
}

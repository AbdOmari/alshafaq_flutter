import 'dart:developer';
import 'package:ashafaq/config/localization/localization_cubit.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/core/alignment/alignment_handler.dart';
import 'package:ashafaq/core/constants/lang_code.dart';
import 'package:ashafaq/core/keys/shared_preferences_keys.dart';
import 'package:ashafaq/features/auth/presentation/screens/login_screen.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});
  static const pageRoute = '/select_lang_screen';
  static String? selectedCode;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final state = context.watch<LocalizationCubit>().state;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: AlignmentHandler.centerLeft(context),
                  child: Text(
                    appLocalizations.language,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    LanguageCard(
                      flag: arFlag,
                      language: 'العربيه',
                      langCode: SupportedLangCode.arabicCode,
                      onTap: () {
                        context.read<LocalizationCubit>().setArLocalization();
                      },
                    ),
                    const SizedBox(height: 25),
                    LanguageCard(
                      flag: enFlag,
                      langCode: SupportedLangCode.englishCode,
                      language: 'English',
                      onTap: () {
                        context.read<LocalizationCubit>().setEnLocalization();
                      },
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                CustomElevatedButton(
                  text: appLocalizations.selectWord,
                  onPressed:
                      state == null
                          ? null
                          : () {
                            context.go(LoginScreen.pageRoute);
                          },
                ),
                const SizedBox(height: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  const LanguageCard({
    super.key,
    required this.flag,
    required this.language,
    required this.langCode,
    required this.onTap,
  });
  final String flag;
  final String language;
  final String langCode;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<LocalizationCubit>().state;
    final state = lang == langCode;
    log('state: $state');
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: state ? const Color(0xff1A1E51) : const Color(0xffE0E5ED),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    border: Border.all(
                      color: const Color(0xff1A1E51),
                      width: .5,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: Text(
                    flag,
                    //textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(width: 15),
                Text(language),
              ],
            ),

            Visibility(
              visible: state,
              child: Transform.scale(
                scale: 1.7,
                child: Checkbox(value: state, onChanged: null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

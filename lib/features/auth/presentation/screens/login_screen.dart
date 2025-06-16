import 'dart:developer';

import 'package:ashafaq/config/shared/buttons/custom_text_button.dart';
import 'package:ashafaq/config/shared/check_box/cubit/check_box_cubit.dart';
import 'package:ashafaq/config/shared/check_box/custom_check_box.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/custom_loading_indicator.dart';
import 'package:ashafaq/config/shared/text_field/cubits/countries_code_cubit.dart';
import 'package:ashafaq/config/shared/text_field/phone_number_text_field.dart';
import 'package:ashafaq/config/shared/toast.dart';
import 'package:ashafaq/core/util/validators/phone_number_validator.dart';
import 'package:ashafaq/features/auth/presentation/code_verification_cubit/code_verification_cubit.dart';
import 'package:ashafaq/features/auth/presentation/screens/auth_base.dart';
import 'package:ashafaq/features/auth/presentation/screens/otp_screen.dart';
import 'package:ashafaq/features/auth/presentation/screens/register_screen.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const pageRoute = '/login_screen';
  static final _validator = PhoneNumberValidator();
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => CheckBoxCubit(),
      child: Builder(
        builder: (context) {
          return AuthBase(
            title: appLocalizations.loginToAccount,
            hint: appLocalizations.pleaseProvideYourInformation,
            body: BlocConsumer<CodeVerificationCubit, CodeVerificationState>(
              listener: (context, state) {
                log('state: $state');
                if (state is OtpFailureState) {
                  CustomToast.showToast(state.phoneError ?? state.error);
                  return;
                }
                if (state is OtpSuccessState) {
                  context.push(
                    OtpScreen.pageRoute,
                    extra: _validator.phoneNumber,
                  );
                }
              },
              builder: (context, state) {
                if (state is OtpLoadingState) {
                  return const CustomLoadingIndicator();
                }
                return Form(
                  key: _validator.formKey,
                  child: Column(
                    children: [
                      BlocProvider(
                        create: (context) => CountriesCodeCubit(),
                        child: Builder(
                          builder: (context) {
                            final cubit = context.read<CountriesCodeCubit>();
                            return PhoneNumberTextField(
                              label: appLocalizations.phone_number,
                              controller: _validator.phoneNumberController,
                              validator:
                                  (value) => _validator.validatePhoneNumber(
                                    context,
                                    value: '${cubit.state.callingCode}$value',
                                  ),
                              onFieldSubmitted:
                                  (value) => _validator.validateForm(),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocBuilder<CheckBoxCubit, bool>(
                            builder: (context, state) {
                              return CustomCheckBox(
                                value: state,
                                onChanged: (_) {
                                  context.read<CheckBoxCubit>().changeValue();
                                },
                              );
                            },
                          ),
                          Text(
                            appLocalizations.rememberMe,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      CustomElevatedButton(
                        text: appLocalizations.logIn,
                        onPressed: () {
                          //?call auth bloc login.
                          final validated = _validator.validateForm();
                          if (validated) {
                            context.read<CodeVerificationCubit>().requestOtp(
                              _validator.phoneNumber!,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),

            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appLocalizations.hasNoAccount,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 10,
                    color: const Color(0xff030303),
                  ),
                ),
                CustomTextButton(
                  btnText: appLocalizations.signUpHere,
                  onPressed: () {
                    context.push(RegisterScreen.pageRoute);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

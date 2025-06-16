import 'package:ashafaq/config/shared/bottom_sheet/success_bottom_sheet.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/buttons/custom_outlined_button.dart';
import 'package:ashafaq/config/shared/custom_loading_indicator.dart';
import 'package:ashafaq/config/shared/toast.dart';
import 'package:ashafaq/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:ashafaq/features/auth/presentation/code_verification_cubit/code_verification_cubit.dart';
import 'package:ashafaq/features/auth/presentation/screens/auth_base.dart';
import 'package:ashafaq/features/auth/presentation/widgets/otp_input.dart';
import 'package:ashafaq/features/home/presentation/screens/home_screen.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.phoneNumber});
  static const pageRoute = '/otp_screen';
  final String phoneNumber;
  static String? _code;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return AuthBase(
      showLeading: true,
      title: appLocalizations.writeYourOtp,
      hint: '${appLocalizations.enterFourDigits}\n $phoneNumber',
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LogInSuccessState) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SuccessBottomSheet(
                  title: appLocalizations.congrats,
                  subTitle: appLocalizations.welcome,
                  btnText: appLocalizations.continueWord,
                  onPressed: () {
                    context.go(HomeScreen.pageRoute);
                  },
                );
              },
            );

            return;
          }
          if (state is LoginErrorState) {
            CustomToast.showToast(
              state.otpError ?? state.phoneNumberError ?? state.generalError,
            );
          }
        },

        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const CustomLoadingIndicator();
          }
          return Column(
            children: [
              OTPInput(
                onCompleted: (code) {
                  _code = code;
                },
              ),
              const SizedBox(height: 100),
              Column(
                children: [
                  CustomOutlinedButton(
                    btnLabel: appLocalizations.haveNotReceivedCode,
                    onPressed: () {
                      context.read<CodeVerificationCubit>().resendOtp(
                        phoneNumber,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomElevatedButton(
                    text: appLocalizations.sendOtp,
                    onPressed: () {
                      if (_code != null) {
                        if (_code != null) {
                          context.read<AuthBloc>().add(
                            LoginEvent(phoneNumber, _code!),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

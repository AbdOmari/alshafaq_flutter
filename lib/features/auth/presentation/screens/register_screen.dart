import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/buttons/custom_text_button.dart';
import 'package:ashafaq/config/shared/check_box/cubit/check_box_cubit.dart';
import 'package:ashafaq/config/shared/check_box/custom_check_box.dart';
import 'package:ashafaq/config/shared/custom_loading_indicator.dart';
import 'package:ashafaq/config/shared/text_field/cubits/countries_code_cubit.dart';
import 'package:ashafaq/config/shared/text_field/custom_text_from_field.dart';
import 'package:ashafaq/config/shared/text_field/phone_number_text_field.dart';
import 'package:ashafaq/core/util/validators/register_validator.dart';
import 'package:ashafaq/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:ashafaq/features/auth/presentation/code_verification_cubit/code_verification_cubit.dart';
import 'package:ashafaq/features/auth/presentation/screens/auth_base.dart';
import 'package:ashafaq/features/auth/presentation/screens/login_screen.dart';
import 'package:ashafaq/features/auth/presentation/screens/otp_screen.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const pageRoute = '/register_screen';
  static final _validator = RegisterValidator();
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final appLocalizations = AppLocalizations.of(context)!;
    return AuthBase(
      title: appLocalizations.createNewAccount,
      hint: appLocalizations.areYouReadyToMakeANewAccount,
      body: BlocProvider(
        create: (context) => CheckBoxCubit(),
        child: Builder(
          builder: (context) {
            return BlocListener<CodeVerificationCubit, CodeVerificationState>(
              listener: (context, state) {
                if (state is OtpSuccessState) {
                  context.push(
                    OtpScreen.pageRoute,
                    extra: _validator.phoneNumber,
                  );
                }
              },
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is RegisterSuccessState) {
                    //context.go(HomeScreen.pageRoute);
                    context.read<CodeVerificationCubit>().requestOtp(
                      _validator.phoneNumber!,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const CustomLoadingIndicator();
                  }
                  final errState = state is RegisterErrorState;
                  return Form(
                    key: _validator.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomTextFromField(
                              label: appLocalizations.name,
                              kbInputType: TextInputType.name,
                              errorText: errState ? state.nameError : null,
                              controller: _validator.firstNameController,
                              preIcon: Icons.person,
                              validator:
                                  (value) => _validator.validateFirstName(
                                    context,
                                    value: value,
                                  ),
                              onFieldSubmitted:
                                  (_) => _validator.validateForm(),
                            ),
                            BlocProvider(
                              create: (context) => CountriesCodeCubit(),
                              child: Builder(
                                builder: (context) {
                                  final cubit =
                                      context.read<CountriesCodeCubit>();
                                  return PhoneNumberTextField(
                                    controller:
                                        _validator.phoneNumberController,
                                    errorText:
                                        errState
                                            ? state.phoneNumberError
                                            : null,
                                    validator:
                                        (
                                          value,
                                        ) => _validator.validatePhoneNumber(
                                          context,
                                          value:
                                              '${cubit.state.callingCode}$value',
                                        ),
                                    onFieldSubmitted:
                                        (_) => _validator.validateForm(),
                                  );
                                },
                              ),
                            ),
                            CustomTextFromField(
                              label: appLocalizations.email,
                              controller: _validator.emailController,
                              kbInputType: TextInputType.emailAddress,
                              errorText: errState ? state.emailError : null,
                              preIcon: Icons.email,
                              validator:
                                  (value) => _validator.validateEmail(
                                    context,
                                    value: value,
                                  ),
                              onFieldSubmitted:
                                  (_) => _validator.validateForm(),
                            ),
                            CustomTextFromField(
                              label: appLocalizations.referCode,
                              kbInputType: TextInputType.number,
                              //errorText: errState ? state.: '',
                              preIcon: FontAwesomeIcons.medal,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      appLocalizations.optional,
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return null;
                                final acceptedNumber = double.tryParse(value);
                                if (acceptedNumber == null) {
                                  return appLocalizations.unValid(
                                    appLocalizations.referCode,
                                  );
                                }
                                return null;
                              },
                              onFieldSubmitted:
                                  (_) => _validator.validateForm(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                BlocBuilder<CheckBoxCubit, bool>(
                                  builder: (context, state) {
                                    return CustomCheckBox(
                                      value: state,
                                      onChanged: (_) {
                                        context
                                            .read<CheckBoxCubit>()
                                            .changeValue();
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  appLocalizations.acceptAllThe,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontSize: 10),
                                ),
                                CustomTextButton(
                                  btnText: appLocalizations.termsAndConditions,
                                  textUnderLine: false,
                                  fontSize: 10,
                                  textColor: Colors.black,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 50),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BlocBuilder<CheckBoxCubit, bool>(
                              builder: (context, state) {
                                return CustomElevatedButton(
                                  text: appLocalizations.signUp,
                                  onPressed:
                                      !state
                                          ? null
                                          : () {
                                            //?call auth bloc login.
                                            final validated =
                                                _validator.validateForm();
                                            if (validated) {
                                              authBloc.add(
                                                RegisterEvent(
                                                  email: _validator.email!,
                                                  name: _validator.firstName!,
                                                  phoneNumber:
                                                      _validator.phoneNumber!,
                                                ),
                                              );
                                              // context.push(
                                              //   OtpScreen.pageRoute,
                                              //   extra: _validator.phoneNumber,
                                              // );
                                            }
                                          },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),

      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appLocalizations.alreadyHaveAnAccount,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 10,
              color: const Color(0xff030303),
            ),
          ),
          CustomTextButton(
            btnText: appLocalizations.signInHere,
            onPressed: () {
              context.go(LoginScreen.pageRoute);
            },
          ),
        ],
      ),

      //bottomSheet: CustomBottomSheet(),
    );
  }
}

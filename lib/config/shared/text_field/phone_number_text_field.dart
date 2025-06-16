import 'package:ashafaq/config/shared/text_field/countries_codes_drop_down.dart';
import 'package:ashafaq/config/shared/text_field/country_code_package/country_code_service.dart';
import 'package:ashafaq/config/shared/text_field/cubits/countries_code_cubit.dart';
import 'package:ashafaq/config/shared/text_field/custom_text_from_field.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    this.label,
    required this.validator,
    required this.onFieldSubmitted,
    this.enabled = true,
    this.textColor = ColorsManger.surface,
    this.errorText,
    this.initialValue,
    this.controller,
  });
  final bool enabled;
  final Color textColor;
  final String? label;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return CustomTextFromField(
      preIcon: Icons.phone,
      label: label ?? AppLocalizations.of(context)!.phone_number,
      controller: controller,
      textColor: textColor,
      enabled: enabled,
      errorText: errorText,
      initialValue: initialValue,
      suffixIcon: BlocBuilder<CountriesCodeCubit, MyCountry>(
        builder: (context, state) {
          return SizedBox(
            width: 130,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: CountriesCodesDropDown(
                      value: state,
                      onSelect: (country) {
                        context.read<CountriesCodeCubit>().selectCountry(
                          country: country ?? state,
                        );
                      },
                    ),
                  ),
                 const VerticalDivider(
                    color: Color(0x33000000), // Set a color
                    thickness: 1, // Optional: how thick the line is
                    width: 15, // Space taken horizontally (adds spacing)
                    indent: 5,
                    endIndent: 5,
                  ),
                  Expanded(
                    child: Text(
                      state.callingCode,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          );
        },
      ),
      kbInputType: TextInputType.phone,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

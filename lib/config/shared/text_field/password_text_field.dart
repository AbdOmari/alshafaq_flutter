import 'package:ashafaq/config/shared/text_field/custom_text_from_field.dart';
import 'package:ashafaq/config/shared/text_field/cubits/password_cubit.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.label,
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
  final String label;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<PasswordCubit, bool>(
            builder: (context, showPassword) {
              return CustomTextFromField(
                label: label,
                preIcon: Icons.password,
                obscureText: showPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<PasswordCubit>().changeVisibility();
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  color: Theme.of(context).colorScheme.surface,
                  iconSize: 18,
                ),
                controller: controller,
                textColor: textColor,
                enabled: enabled,
                errorText: errorText,
                initialValue: initialValue,
                kbInputType: TextInputType.visiblePassword,
                validator: validator,
                onFieldSubmitted: onFieldSubmitted,
              );
            },
          );
        },
      ),
    );
  }
}

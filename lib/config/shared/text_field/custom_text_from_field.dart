import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    this.maxLines = 1,
    this.obscureText = false,
    this.enabled = true,
    this.textColor = ColorsManger.surface,
    this.textSize = 14,
    this.errorText,

    this.initialValue,
    required this.label,
    required this.kbInputType,
    this.controller,
    this.suffixIcon,
    required this.preIcon,
    required this.validator,
    required this.onFieldSubmitted,
  });
  final int maxLines;
  final Widget? suffixIcon;
  final IconData preIcon;
  final bool enabled;

  final Color textColor;
  final double textSize;
  final String label;
  final String? errorText;
  final String? initialValue;
  final bool obscureText;
  final TextInputType kbInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              controller: controller,
              validator: validator,
              initialValue: initialValue,
              maxLines: maxLines,
              obscureText: obscureText,
              keyboardType: kbInputType,
              autofillHints: _autoFillHints(kbInputType),
              autocorrect: true,
              autofocus: false,
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: onFieldSubmitted,
              enabled: enabled,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontSize: textSize),
              //?focus on the next field.
              textInputAction:
                  maxLines < 2 ? TextInputAction.next : TextInputAction.newline,
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                filled: true,
                errorText: errorText,
                suffixIcon: suffixIcon,
                prefixIcon: Icon(preIcon, color: const Color(0xff1A1E51)),
                label: Text(label),
                labelStyle: Theme.of(context).textTheme.labelMedium,
                //?default border
                border: _border(),
                //?border when the field is enabled
                enabledBorder: _border(),
                //?when we focus to write in the field
                focusedBorder: _focusedBorder(),
                //?when error and not focused
                errorBorder: _border(color: Colors.red),
                //?when the field not enabled
                disabledBorder: _border(color: Colors.grey),
                //?focused and error.
                focusedErrorBorder: _focusedBorder(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  InputBorder _focusedBorder({
    Color color = const Color(0xff1A1E51),
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: width, color: color),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }

  InputBorder _border({
    color = const Color.fromARGB(88, 158, 158, 158),
    double width = .0,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: width, color: color),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }

  List<String> _autoFillHints(TextInputType kbType) {
    switch (kbType) {
      case TextInputType.visiblePassword:
        return [AutofillHints.password];
      case TextInputType.emailAddress:
        return [AutofillHints.email];
      case TextInputType.phone:
        return [AutofillHints.telephoneNumber];

      default:
        return [AutofillHints.name];
    }
  }
}

import 'package:ashafaq/core/util/validators/text_field_validator.dart';
import 'package:flutter/material.dart';

final class NumberValidator {
  final _textFieldValidator = const TextFieldValidator();
  final numberController = TextEditingController();
  //? number holder
  String? _number;
  String? get number => _number;

  String? validateNumber(BuildContext context, {required String? value}) {
    //?reset  number
    _number = null;
    final result = _textFieldValidator.validateNumber(context, value);
    if (result == null) _number = value;
    return result;
  }

  void setFieldsValues({String? number}) {
    numberController.text = number ?? this.number ?? '';
  }

  void dispose() {
    numberController.dispose();
  }
}

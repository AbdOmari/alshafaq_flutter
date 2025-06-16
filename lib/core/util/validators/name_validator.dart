import 'package:ashafaq/core/util/validators/text_field_validator.dart';
import 'package:flutter/material.dart';

final class NameValidator {
  final _textFieldValidator = const TextFieldValidator();
  final nameController = TextEditingController();
  //? name holder
  String? _name;
  String? get name => _name;

  String? validateName(
    BuildContext context, {
    required String? value,
    String? fieldName,
  }) {
    //?reset  name
    _name = null;
    final result = _textFieldValidator.validateName(
      context,
      value,
      fieldName: fieldName,
    );
    if (result == null) _name = value;
    return result;
  }

  void setFieldsValues({String? name}) {
    nameController.text = name ?? this.name ?? '';
  }

  void dispose() {
    nameController.dispose();
  }
}

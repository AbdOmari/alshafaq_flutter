import 'package:ashafaq/core/util/validators/form_validator.dart';
import 'package:ashafaq/core/util/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
class PhoneNumberValidator {
  final _formValidator = FormValidator();
  GlobalKey<FormState> get formKey => _formValidator.formKey;
  bool validateForm() => _formValidator.validateForm();

  final _textFieldValidator = const TextFieldValidator();
  //?set of common controllers
  final phoneNumberController = TextEditingController();
  //?email holder
  String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;
  //?validate email
  String? validatePhoneNumber(BuildContext context, {required String? value}) {
    //?reset email
    log('phone val: $value');
    _phoneNumber = null;
    final result = _textFieldValidator.validatePhoneNumber(context, value);
    if (result == null) _phoneNumber = value;
    return result;
  }

  void setFieldsValues({String? phoneNumber}) {
    phoneNumberController.text = phoneNumber ?? this.phoneNumber ?? '';
  }

  //?dispose controllers

  void dispose() {
    phoneNumberController.dispose();
  }
}

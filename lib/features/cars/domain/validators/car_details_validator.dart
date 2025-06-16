import 'package:ashafaq/core/util/validators/form_validator.dart';
import 'package:ashafaq/core/util/validators/name_validator.dart';
import 'package:ashafaq/core/util/validators/number_validator.dart';

final class CarDetailsValidator {
  final formValidator = FormValidator();
  final carNameValidator = NameValidator();
  final cityValidator = NameValidator();
  final colorValidator = NameValidator();
  final platNumbersValidator = NumberValidator();
  
}

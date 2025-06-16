import 'package:ashafaq/config/shared/text_field/country_code_package/country_code_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesCodeCubit extends Cubit<MyCountry> {
  final MyCountry? initial;
  CountriesCodeCubit({this.initial})
    : super(initial ?? CountryCodeService.defaultCountry);

  void selectCountry({required MyCountry country}) => emit(country);
}

import 'package:ashafaq/config/shared/custom_loading_indicator.dart';
import 'package:ashafaq/config/shared/text_field/country_code_package/country_code_service.dart';
import 'package:ashafaq/config/shared/text_field/country_info_list_tile.dart';
import 'package:flutter/material.dart';

class CountriesCodesDropDown extends StatefulWidget {
  const CountriesCodesDropDown({
    super.key,
    required this.value,
    required this.onSelect,
  });
  final MyCountry? value;
  final void Function(MyCountry? country) onSelect;

  @override
  State<CountriesCodesDropDown> createState() => _CountriesCodesDropDownState();
}

class _CountriesCodesDropDownState extends State<CountriesCodesDropDown> {
  Future<List<MyCountry>> _getCountriesCodes({
    required BuildContext context,
  }) async {
    return await CountryCodeService.getCountries();
  }

  @override
  void initState() {
    _getCountriesCodes(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCountriesCodes(context: context),
      builder: (context, asyncSnapshot) {
        final data = asyncSnapshot.data;
        final connectionState = asyncSnapshot.connectionState;
        if (connectionState == ConnectionState.done) {
          return SizedBox(
            width: 55,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<MyCountry>(
                value: widget.value,
                items:
                    data!.map((item) {
                      return DropdownMenuItem<MyCountry>(
                        value: item,
                        alignment: Alignment.center,
                        child: CountryFlag(flag: item.flag),
                      );
                    }).toList(),
                onChanged: (value) => widget.onSelect(value),
              ),
            ),
          );
        }
        if (connectionState == ConnectionState.waiting) {
          return const CustomLoadingIndicator();
        }
        return const Text('something went wrong');
      },
    );
  }
}

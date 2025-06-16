import 'dart:convert';
import 'package:country_calling_code_picker_plus/country_calling_code_picker_plus.dart';
import 'package:flutter/services.dart' show rootBundle;

final class CountryCodeService {
  static Future<List<MyCountry>> getCountries() async => _loadCountries();

  static const defaultCountry = MyCountry(
    countryCode: 'SA',
    flag: 'assets/flags/sau.png',
    name: 'Saudi Arabia',
    callingCode: '+966',
  );

  static String get flagsPackage => countryCodePackageName;

  static Future<List<MyCountry>> _loadCountries() async {
    String jsonString = await rootBundle.loadString(
      'assets/raw/country_codes.json',
    );

    // Parse the JSON string
    final List<dynamic> jsonList = jsonDecode(jsonString);

    final List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(
      jsonList,
    );
    return items.map<MyCountry>((json) => MyCountry.fromJson(json)).toList();
  }
}

final class MyCountry {
  final String name;
  final String flag;
  final String callingCode;
  final String countryCode;
  const MyCountry({
    required this.callingCode,
    required this.countryCode,
    required this.flag,
    required this.name,
  });

  factory MyCountry.fromJson(Map<String, dynamic> json) {
    return MyCountry(
      callingCode: json['calling_code'],
      countryCode: json['country_code'],
      flag: "assets/${json['flag']}",
      name: json['name'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyCountry &&
          callingCode == other.callingCode &&
          countryCode == other.countryCode;

  @override
  int get hashCode => callingCode.hashCode ^ countryCode.hashCode;

  @override
  String toString() => 'MyCountry($flag, $name, $callingCode, $countryCode)';
}

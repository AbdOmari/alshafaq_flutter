import 'package:flutter/material.dart';

class CountryFlag extends StatelessWidget {
  const CountryFlag({super.key, required this.flag});
  final String flag;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(height: 28, width: 28, flag, fit: BoxFit.cover),
    );
  }
}

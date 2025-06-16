import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const pageRoute = 'settings-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('settings')));
  }
}

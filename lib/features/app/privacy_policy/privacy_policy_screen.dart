import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});
  static const pageRoute = '/privacy-policy';

  @override
  Widget build(BuildContext context) {
     return const Scaffold(body: Center(child: Text('privacy policy')));
  }
}

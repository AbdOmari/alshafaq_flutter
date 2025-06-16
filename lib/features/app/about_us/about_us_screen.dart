import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  static const pageRoute = '/about-us';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('about us'),),
    );
  }
}

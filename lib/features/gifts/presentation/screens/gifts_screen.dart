import 'package:flutter/material.dart';

class GiftsScreen extends StatelessWidget {
  const GiftsScreen({super.key});
  static const pageRoute = '/gifts-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('gifts')));
  }
}

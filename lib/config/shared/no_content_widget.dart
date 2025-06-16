import 'package:flutter/material.dart';

class NoContentWidget extends StatelessWidget {
  const NoContentWidget({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(label));
  }
}

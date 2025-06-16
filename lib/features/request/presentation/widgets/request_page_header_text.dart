import 'package:ashafaq/core/alignment/alignment_handler.dart';
import 'package:flutter/material.dart';

class RequestPageHeaderText extends StatelessWidget {
  const RequestPageHeaderText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentHandler.centerLeft(context),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

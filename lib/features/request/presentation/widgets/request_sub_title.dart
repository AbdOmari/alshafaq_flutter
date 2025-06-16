import 'package:ashafaq/core/alignment/alignment_handler.dart';
import 'package:flutter/material.dart';

class RequestSubTitle extends StatelessWidget {
  const RequestSubTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentHandler.centerLeft(context),
      child: Text(title, style: const TextStyle(fontSize: 14)),
    );
  }
}

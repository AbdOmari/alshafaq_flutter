import 'package:ashafaq/core/alignment/alignment_handler.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentHandler.centerLeft(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}

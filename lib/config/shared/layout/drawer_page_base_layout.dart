import 'package:ashafaq/config/shared/drawer/components/app_bar_leading_arrow.dart';
import 'package:ashafaq/core/alignment/alignment_handler.dart';
import 'package:flutter/material.dart';

class DrawerPageBaseLayout extends StatelessWidget {
  const DrawerPageBaseLayout({
    super.key,
    required this.title,
    this.appBarTrailing,
    required this.content,
  });
  final Widget content;
  final String title;
  final Widget? appBarTrailing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppBarLeadingArrow(),

                if (appBarTrailing != null) appBarTrailing!,
              ],
            ),
            const SizedBox(height: 15),
            Align(
              alignment: AlignmentHandler.centerLeft(context),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xff030303),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}

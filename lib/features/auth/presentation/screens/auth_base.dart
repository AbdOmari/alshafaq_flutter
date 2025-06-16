import 'package:ashafaq/config/shared/app_logo.dart';
import 'package:ashafaq/config/shared/drawer/components/app_bar_leading_arrow.dart';
import 'package:flutter/material.dart';

class AuthBase extends StatelessWidget {
  const AuthBase({
    super.key,
    required this.title,
    required this.hint,
    required this.body,
    this.trailing,
    this.bottomSheet,
    this.showLeading = false,
  });
  final String title;
  final String hint;
  final bool showLeading;
  final Widget body;
  final Widget? bottomSheet;

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 43.0, left: 18, right: 18),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const AppLogo(),
                SizedBox(
                  height: showLeading ? 45 : 70,
                  child:
                      showLeading
                          ? const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [AppBarLeadingArrow()],
                          )
                          : null,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  hint,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                body,

                if (trailing != null) trailing!,
              ],
            ),
          ),
        ),
      ),
      bottomSheet: bottomSheet,
    );
  }
}

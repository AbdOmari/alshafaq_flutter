import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({super.key});
  static const pageRoute = '/subscription_screen';

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(body: Center(child: Text(appLocalizations.subscriptions)));
  }
}

import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});
  static const pageRoute = '/requests_screen';

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(body: Center(child: Text(appLocalizations.requests)));
  }
}

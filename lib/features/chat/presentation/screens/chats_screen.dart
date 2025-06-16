import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});
  static const pageRoute = '/chat_screen';

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(body: Center(child: Text(appLocalizations.chats)));
  }
}

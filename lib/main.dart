import 'package:ashafaq/app/home.dart';
// import 'package:ashafaq/config/network/tokens/impl/token_service.dart';
// import 'package:ashafaq/config/network/tokens/impl/tokens_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  // TokensRepo t = TokensRepo(TokensService());
  // await t.deleteAccessToken();
  runApp(const MyApp());
}

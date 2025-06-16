import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/features/home/presentation/screens/home_screen.dart';
import 'package:ashafaq/features/start/cubits/is_logged_in_cubit.dart';
import 'package:ashafaq/features/start/screens/select_language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const pageRoute = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _start() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    if (mounted) {
      context.read<IsLoggedInCubit>().isLoggedIn();
    }
  }

  @override
  void initState() {
    _start();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IsLoggedInCubit, bool?>(
      listener: (context, state) {
        if (state == true) {
          context.go(HomeScreen.pageRoute);
          return;
        }
        context.go(SelectLanguageScreen.pageRoute);
      },
      child: Scaffold(
        body: Center(child: LottieBuilder.asset(ImageManger.splashImage)),
      ),
    );
  }
}

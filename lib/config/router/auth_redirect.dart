import 'package:ashafaq/features/auth/presentation/screens/login_screen.dart';
import 'package:ashafaq/features/start/cubits/user_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

typedef RedirectCheck = String? Function(BuildContext context);

String? requireAuthRedirect(BuildContext context, GoRouterState state) {
  final authStatus = context.read<UserModeCubit>().state;

  if (authStatus != UserMode.authenticated) {
    return '${LoginScreen.pageRoute}?redirect=${state.uri.toString()}';
  }

  return null;
}

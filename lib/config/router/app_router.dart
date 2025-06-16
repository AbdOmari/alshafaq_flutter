import 'package:ashafaq/config/helpers/dio_helper.dart';
import 'package:ashafaq/config/helpers/internet_connection_helper.dart';
import 'package:ashafaq/config/network/headers/headers.dart';
import 'package:ashafaq/config/network/tokens/impl/token_service.dart';
import 'package:ashafaq/config/network/tokens/impl/tokens_repo.dart';
import 'package:ashafaq/config/shared/maps/cubit/map_cubit.dart';
import 'package:ashafaq/config/shared/maps/location_picker_screen.dart';
import 'package:ashafaq/features/app/about_us/about_us_screen.dart';
import 'package:ashafaq/features/app/contact_us/contact_us_screen.dart';
import 'package:ashafaq/features/app/privacy_policy/privacy_policy_screen.dart';
import 'package:ashafaq/features/app/terms_and_conditions/terms_and_conditions_screen.dart';
import 'package:ashafaq/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:ashafaq/features/auth/data/services_impl/auth_service_impl.dart';
import 'package:ashafaq/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:ashafaq/features/auth/presentation/code_verification_cubit/code_verification_cubit.dart';
import 'package:ashafaq/features/auth/presentation/screens/login_screen.dart';
import 'package:ashafaq/features/auth/presentation/screens/otp_screen.dart';
import 'package:ashafaq/features/auth/presentation/screens/register_screen.dart';
import 'package:ashafaq/features/cars/data/repo_impl/cars_repo_impl.dart';
import 'package:ashafaq/features/cars/data/services_impl/cars_service_impl.dart';
import 'package:ashafaq/features/cars/presentation/screens/add_new_car_screen.dart';
import 'package:ashafaq/features/cars/presentation/screens/bloc/cars_bloc.dart';
import 'package:ashafaq/features/cars/presentation/screens/cars_screen.dart';
import 'package:ashafaq/features/chat/presentation/screens/chats_screen.dart';
import 'package:ashafaq/features/gifts/presentation/screens/gifts_screen.dart';
import 'package:ashafaq/features/home/data/repo_impl/banners_repo_impl.dart';
import 'package:ashafaq/features/home/data/repo_impl/package_repo_impl.dart';
import 'package:ashafaq/features/home/data/services_impl/banners_service_impl.dart';
import 'package:ashafaq/features/home/data/services_impl/packages_service_impl.dart';
import 'package:ashafaq/features/home/domain/entities/packages/package.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/all_packages_cubit/all_packages_cubit.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/banners_cubit/banners_cubit.dart';
import 'package:ashafaq/features/home/presentation/screens/home_base.dart';
import 'package:ashafaq/features/home/presentation/screens/home_screen.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/saving_packages_cubit/saving_packages_cubit.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/single_wash_cubit/single_wash_cubit.dart';
import 'package:ashafaq/features/locations/data/repo_impl/locations_repo_impl.dart';
import 'package:ashafaq/features/locations/data/repo_impl/zones_repo_impl.dart';
import 'package:ashafaq/features/locations/data/services_impl/locations_service_impl.dart';
import 'package:ashafaq/features/locations/data/services_impl/zones_service_impl.dart';
import 'package:ashafaq/features/locations/presentation/screens/add_location_screen.dart';
import 'package:ashafaq/features/locations/presentation/screens/locations_cubit/locations_cubit.dart';
import 'package:ashafaq/features/locations/presentation/screens/locations_screen.dart';
import 'package:ashafaq/features/locations/presentation/screens/zones_cubit/zones_cubit.dart';
import 'package:ashafaq/features/request/data/repo_impl/addons_repo_impl.dart';
import 'package:ashafaq/features/request/data/services_impl/addons_service_impl.dart';
import 'package:ashafaq/features/request/presentation/screens/addons/addons_cubit/addons_cubit.dart';
import 'package:ashafaq/features/request/presentation/screens/request_screen.dart';
import 'package:ashafaq/features/request/presentation/screens/add_request_screen.dart';
import 'package:ashafaq/features/request/presentation/widgets/addons/extras_cubit/extras_cubit.dart';
import 'package:ashafaq/features/request/presentation/widgets/addons/services_cubit/services_cubit.dart';
import 'package:ashafaq/features/settings/presentation/screens/settings_screen.dart';
import 'package:ashafaq/features/start/cubits/is_logged_in_cubit.dart';
import 'package:ashafaq/features/start/screens/select_language_screen.dart';
import 'package:ashafaq/features/start/screens/splash_screen.dart';
import 'package:ashafaq/features/subscriptions/presentation/screens/subscriptions_screen.dart';
import 'package:ashafaq/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'dependencies.dart';
part 'router.dart';

CustomTransitionPage _buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder:
        (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
  );
}

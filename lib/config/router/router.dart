part of 'app_router.dart';

final router = GoRouter(
  initialLocation: SplashScreen.pageRoute,
  //!here the routes of the app screens.
  routes: [
    //?splash screen
    GoRoute(
      path: SplashScreen.pageRoute,
      builder:
          (context, state) => BlocProvider(
            create: (context) => IsLoggedInCubit(_tokensRepo),
            child: const SplashScreen(),
          ),
    ),

    //?select language screen
    GoRoute(
      path: SelectLanguageScreen.pageRoute,
      builder: (context, state) {
        return const SelectLanguageScreen();
      },
    ),

    //?register screen
    GoRoute(
      path: RegisterScreen.pageRoute,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _codeVerificationCubit),
            BlocProvider.value(value: _authBloc),
          ],
          child: const RegisterScreen(),
        );
      },
    ),

    //?login screen
    GoRoute(
      path: LoginScreen.pageRoute,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _codeVerificationCubit),
            BlocProvider.value(value: _authBloc),
          ],
          child: const LoginScreen(),
        );
      },
    ),
    //?otp screen
    GoRoute(
      path: OtpScreen.pageRoute,
      builder: (context, state) {
        final extra = state.extra.toString();
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _codeVerificationCubit),
            BlocProvider.value(value: _authBloc),
          ],
          child: OtpScreen(phoneNumber: extra.toString()),
        );
      },
    ),
    //?add request screen
    GoRoute(
      path: AddRequestScreen.pageRoute,
      pageBuilder:
          (context, state) => _buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => ExtrasCubit(_addonsRepo)),
                BlocProvider(create: (context) => ServicesCubit(_addonsRepo)),
                BlocProvider(create: (context) => AddonsCubit(_addonsRepo)),
              ],
              child: AddRequestScreen(package: state.extra as Package),
            ),
          ),
    ),
    GoRoute(
      path: LocationPickerScreen.pageRoute,
      pageBuilder:
          (context, state) => _buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: LocationPickerScreen(
              //initialLocation: state.extra as MapLocation?,
              mapCubit: state.extra as MapCubit,
            ),
          ),
    ),
    
    ShellRoute(
      builder: (context, state, child) {
        return HomeBase(child: child);
      },
      routes: [
        GoRoute(
          path: HomeScreen.pageRoute,

          pageBuilder:
              (context, state) => _buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => SavingPackagesCubit(_packagesRepo),
                    ),
                    BlocProvider(
                      create: (context) => SingleWashCubit(_packagesRepo),
                    ),
                    BlocProvider(
                      create: (context) => PopularPackagesCubit(_packagesRepo),
                    ),
                    BlocProvider(
                      create: (context) => AllPackagesCubit(_packagesRepo),
                    ),
                    BlocProvider(
                      create: (context) => BannersCubit(_bannersRepo),
                    ),
                  ],
                  child: HomeScreen(scaffoldKey: HomeBase.scaffoldKey),
                ),
              ),
        ),
        GoRoute(
          path: RequestScreen.pageRoute,
          pageBuilder:
              (context, state) => _buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const RequestScreen(),
              ),
        ),
        GoRoute(
          path: SubscriptionsScreen.pageRoute,
          pageBuilder:
              (context, state) => _buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const SubscriptionsScreen(),
              ),
        ),
        GoRoute(
          path: ChatsScreen.pageRoute,
          pageBuilder:
              (context, state) => _buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const ChatsScreen(),
              ),
        ),
      ],
    ),
    GoRoute(
      path: CarsScreen.pageRoute,
      builder:
          (context, state) =>
              BlocProvider.value(value: _carsBloc, child: const CarsScreen()),
    ),
    GoRoute(
      path: AddNewCarScreen.pageRoute,
      builder:
          (context, state) => BlocProvider.value(
            value: _carsBloc,
            child: const AddNewCarScreen(),
          ),
    ),
    GoRoute(
      path: WalletScreen.pageRoute,
      builder: (context, state) => const WalletScreen(),
    ),

    GoRoute(
      path: LocationsScreen.pageRoute,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _locationsCubit),
              BlocProvider.value(value: _zonesCubit),
            ],
            child: const LocationsScreen(),
          ),
    ),

    GoRoute(
      path: AddLocationScreen.pageRoute,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _locationsCubit),
              BlocProvider.value(value: _zonesCubit),
            ],
            child: const AddLocationScreen(),
          ),
    ),

    GoRoute(
      path: GiftsScreen.pageRoute,
      builder: (context, state) => const GiftsScreen(),
    ),
    GoRoute(
      path: ContactUsScreen.pageRoute,
      builder: (context, state) => const ContactUsScreen(),
    ),
    GoRoute(
      path: SettingsScreen.pageRoute,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: AboutUsScreen.pageRoute,
      builder: (context, state) => const AboutUsScreen(),
    ),
    GoRoute(
      path: PrivacyPolicyScreen.pageRoute,
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: TermsAndConditionsScreen.pageRoute,
      builder: (context, state) => const TermsAndConditionsScreen(),
    ),
  ],
);

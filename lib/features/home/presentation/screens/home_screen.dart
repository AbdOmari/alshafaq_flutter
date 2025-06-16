import 'dart:developer';

import 'package:ashafaq/config/shared/app_logo.dart';
import 'package:ashafaq/config/shared/bottom_sheet/coming_soon_sheet.dart';
import 'package:ashafaq/core/constants/services_list.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/all_packages_cubit/all_packages_cubit.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/banners_cubit/banners_cubit.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/popular_packages_cubit/popular_packages_cubit.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/saving_packages_cubit/saving_packages_cubit.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/single_wash_cubit/single_wash_cubit.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/shimmer_loading.dart';
import 'package:ashafaq/features/home/presentation/widgets/sections/all_packages_section.dart';
import 'package:ashafaq/features/home/presentation/widgets/sections/popular_packages_section.dart';
import 'package:ashafaq/features/home/presentation/widgets/sections/saving_packages_section.dart';
import 'package:ashafaq/features/home/presentation/widgets/sections/single_wash_section.dart';
import 'package:ashafaq/features/home/presentation/widgets/slider/image_slider.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/section_header.dart';
import 'package:ashafaq/config/shared/cubit/int_base_cubit.dart';
import 'package:ashafaq/features/home/presentation/widgets/wash_service_card/wash_service_card.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.scaffoldKey});
  static const pageRoute = '/home_screen';
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void getPackages() {
    context.read<SingleWashCubit>().getPackages();
    context.read<SavingPackagesCubit>().getPackages();
    context.read<PopularPackagesCubit>().getPackages();
    context.read<BannersCubit>().getBanners();
  }

  @override
  void initState() {
    getPackages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final d = Dimensions(MediaQuery.of(context).size);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => getPackages(),
        child: MultiBlocListener(
          listeners: [
            BlocListener<SavingPackagesCubit, SavingPackagesState>(
              listener:
                  (_, _) => context.read<AllPackagesCubit>().getPackages(),
            ),
            BlocListener<SingleWashCubit, SingleWashState>(
              listener:
                  (_, _) => context.read<AllPackagesCubit>().getPackages(),
            ),
            BlocListener<PopularPackagesCubit, PopularPackagesState>(
              listener:
                  (_, _) => context.read<AllPackagesCubit>().getPackages(),
            ),
          ],
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const AppLogo(width: 79, height: 42),
                const SizedBox(height: 5),
                //?slider in the top
                BlocBuilder<BannersCubit, BannersState>(
                  builder: (context, state) {
                    log('banners state: $state');
                    if (state is GotBannersState) {
                      return BannersSlider(
                        width: d.getComponentW(uiW: 398),
                        height: d.getComponentH(uiH: 167),
                        banners: state.banners,
                      );
                    }
                    if (state is BannersLoadingState) {
                      return ShimmerLoading(d: d);
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 15),
                //?the three services in the top of the screen.
                Column(
                  children: [
                    SectionHeader(title: appLocalizations.chooseOurService),
                    const SizedBox(height: 10),
                    BlocProvider(
                      create: (context) => IntBaseCubit(),
                      child: SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: servicesList(context).length,
                          itemBuilder: (context, index) {
                            final cubit = context.read<IntBaseCubit>();
                            final item = servicesList(context)[index];
                            return BlocBuilder<IntBaseCubit, int>(
                              builder: (context, state) {
                                return WashServiceCard(
                                  d: d,
                                  selected: state == index,
                                  onTap: () {
                                    context.read<IntBaseCubit>().chooseItem(
                                      index,
                                    );
                                    if (index != 0) {
                                      showModalBottomSheet(
                                        context: context,
                                        isDismissible: false,
                                        builder: (context) {
                                          return ComingSoonSheet(
                                            onPressed: () {
                                              cubit.chooseItem(0);
                                              context.pop();
                                            },
                                          );
                                        },
                                      );
                                    }
                                  },
                                  item: item,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                //?single time wash
                SingleWashSection(d: d),
                const SizedBox(height: 15),
                //?saving packages
                SavingPackagesSection(d: d),
                const SizedBox(height: 15),
                //?popular package
                PopularPackagesSection(d: d),
                const SizedBox(height: 15),
                //?all packages part
                AllPackagesSection(d: d),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

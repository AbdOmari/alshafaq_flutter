import 'package:ashafaq/config/shared/cubit/int_base_cubit.dart';
import 'package:ashafaq/config/shared/no_content_widget.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/all_packages_cubit/all_packages_cubit.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/package_section_dots.dart';
import 'package:ashafaq/features/home/presentation/widgets/package/all_packages_widget.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/section_header.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/shimmer_loading.dart';
import 'package:ashafaq/features/home/presentation/widgets/slider/custom_slider.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPackagesSection extends StatelessWidget {
  const AllPackagesSection({super.key, required this.d});
  final Dimensions d;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        SectionHeader(title: appLocalizations.allPackages),
        const SizedBox(height: 5),
        SizedBox(
          height: d.getComponentH(uiH: 260),
          child: BlocProvider(
            create: (context) => IntBaseCubit(),
            child: Builder(
              builder: (context) {
                return BlocBuilder<AllPackagesCubit, AllPackagesState>(
                  builder: (context, state) {
                    if (state is AllPackagesLoadingState) {
                      return ShimmerLoading(d: d);
                    } else if (state is GotAllPackagesState) {
                      final packages = state.packages;
                      return Column(
                        children: [
                          CustomSlider(
                            height: d.getComponentH(uiH: 220),
                            items:
                                packages
                                    .map(
                                      (package) => AllPackagesCard(
                                        package: package,
                                        d: d,
                                      ),
                                    )
                                    .toList(),
                            onPageChanged:
                                (index, _) => context
                                    .read<IntBaseCubit>()
                                    .chooseItem(index),
                          ),
                          const SizedBox(height: 10),
                          PackageSectionDots(nOfItems: packages.length),
                        ],
                      );
                    }
                    return NoContentWidget(
                      label: appLocalizations.noContent(
                        appLocalizations.packages,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

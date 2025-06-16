import 'package:ashafaq/config/shared/cubit/int_base_cubit.dart';
import 'package:ashafaq/config/shared/no_content_widget.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/saving_packages_cubit/saving_packages_cubit.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/package_section_dots.dart';
import 'package:ashafaq/features/home/presentation/widgets/package/saving_package_card.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/section_header.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/shimmer_loading.dart';
import 'package:ashafaq/features/home/presentation/widgets/slider/custom_slider.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavingPackagesSection extends StatelessWidget {
  const SavingPackagesSection({super.key, required this.d});
  final Dimensions d;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        SectionHeader(title: appLocalizations.savingPackages),
        const SizedBox(height: 5),
        SizedBox(
          height: d.getComponentH(uiH: 260),
          child: BlocProvider(
            create: (context) => IntBaseCubit(),
            child: Builder(
              builder: (context) {
                return BlocBuilder<SavingPackagesCubit, SavingPackagesState>(
                  builder: (context, state) {
                    if (state is SavingPackagesLoadingState) {
                      return ShimmerLoading(d: d);
                    }
                    if (state is GotSavingPackagesState) {
                      final packages = state.packages;
                      return Column(
                        children: [
                          CustomSlider(
                            height: d.getComponentH(uiH: 220),
                            items:
                                packages
                                    .map(
                                      (package) => SavingPackageCard(
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
                    if (state is SavingPackagesFailureState) {
                      return NoContentWidget(
                        label: appLocalizations.noContent(
                          appLocalizations.packages,
                        ),
                      );
                    }
                    if (state is NoPackagesState) {
                      return NoContentWidget(
                        label: appLocalizations.noContent(
                          appLocalizations.packages,
                        ),
                      );
                    }
                    return const SizedBox();
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

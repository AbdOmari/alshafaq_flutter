import 'package:ashafaq/config/shared/no_content_widget.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/presentation/screens/cubits/single_wash_cubit/single_wash_cubit.dart';
import 'package:ashafaq/features/home/presentation/widgets/package/single_wash_package_card.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/section_header.dart';
import 'package:ashafaq/features/home/presentation/widgets/components/shimmer_loading.dart';
import 'package:ashafaq/features/request/presentation/screens/add_request_screen.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SingleWashSection extends StatelessWidget {
  const SingleWashSection({super.key, required this.d});
  final Dimensions d;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        SectionHeader(title: appLocalizations.bookASingleWash),
        const SizedBox(height: 5),
        SizedBox(
          height: d.getComponentH(uiH: 260),
          child: BlocBuilder<SingleWashCubit, SingleWashState>(
            builder: (context, state) {
              if (state is SingleWashLoadingState) {
                return ShimmerLoading(d: d);
              }
              if (state is GotSingleWashState) {
                return SingleWashPackageCard(
                  d: d,

                  package: state.package,
                  onTap: () {
                    context.push(
                      AddRequestScreen.pageRoute,
                      extra: state.package,
                    );
                  },
                );
              }
              if (state is SingleWashFailureState) {
                return NoContentWidget(
                  label: appLocalizations.noContent(appLocalizations.content),
                );
              }
              if (state is NoPackageState) {
                return NoContentWidget(
                  label: appLocalizations.noContent(appLocalizations.content),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}

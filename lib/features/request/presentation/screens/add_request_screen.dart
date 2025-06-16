import 'dart:developer';

import 'package:ashafaq/config/shared/bottom_sheet/success_bottom_sheet.dart';
import 'package:ashafaq/config/shared/drawer/components/app_bar_leading_arrow.dart';
import 'package:ashafaq/config/shared/toast.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/domain/entities/packages/package.dart';
import 'package:ashafaq/features/home/presentation/screens/home_screen.dart';
import 'package:ashafaq/config/shared/cubit/int_base_cubit.dart';
import 'package:ashafaq/features/request/data/models/addons/addons.dart';
import 'package:ashafaq/features/request/data/models/request_details/request_details.dart';
import 'package:ashafaq/features/request/presentation/screens/addons/addons_cubit/addons_cubit.dart';
import 'package:ashafaq/features/request/presentation/screens/addons/addons_page.dart';
import 'package:ashafaq/features/request/presentation/screens/request_details_page.dart';
import 'package:ashafaq/features/request/presentation/screens/payment/request_summary_page.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddRequestScreen extends StatefulWidget {
  const AddRequestScreen({super.key, required this.package});
  static const pageRoute = '/add-request-screen';
  final Package package;

  @override
  State<AddRequestScreen> createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> {
  final controller = PageController();
  final addons = Addons();
  late final RequestDetails requestDetails;

  @override
  void initState() {
    //?here we just need to get the addons once.
    //?in the addons listener we will call get services and extras cubits
    context.read<AddonsCubit>().getAddons();
    requestDetails = RequestDetails(widget.package);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final duration = const Duration(milliseconds: 300);
  final curve = Curves.ease;
  void goNext(BuildContext ctx, int index) {
    controller.nextPage(duration: duration, curve: curve);
    ctx.read<IntBaseCubit>().chooseItem(index);
  }

  void goBack(BuildContext ctx, int index) {
    if (index == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return;
    }
    ctx.read<IntBaseCubit>().chooseItem(index);
    controller.previousPage(duration: duration, curve: curve);
  }

  @override
  Widget build(BuildContext context) {
    final d = Dimensions(MediaQuery.of(context).size);
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocProvider(
        create: (context) => IntBaseCubit(initialValue: 1),
        child: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        //?this is the back arrow in the top of the page
                        AppBarLeadingArrow(
                          onTap: () {
                            final currentPage = controller.page;
                            log('$currentPage');
                            final index = currentPage?.round(); // or .toInt()

                            log('$index');
                            if (index != null) goBack(context, index);
                          },
                        ),
                        const SizedBox(width: 30),
                        //?this will be the progress indicator
                        Expanded(
                          child: BlocBuilder<IntBaseCubit, int>(
                            builder: (context, state) {
                              return TweenAnimationBuilder<double>(
                                tween: Tween<double>(begin: 0, end: state / 3),
                                duration: duration,
                                builder: (context, value, child) {
                                  return LinearProgressIndicator(
                                    value: value,
                                    minHeight: 10,
                                    backgroundColor: const Color(0xffEAECF0),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          ColorsManger.primaryColor,
                                        ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: [
                        RequestDetailsPage(
                          dimensions: d,
                          requestDetails: requestDetails,
                          appLocalizations: appLocalizations,
                          onPressed: () {
                            final isValid = requestDetails.isValid(
                              appLocalizations,
                            );
                            if (isValid == null) {
                              log('details: $requestDetails');
                              goNext(context, 2);
                              return;
                            }
                            CustomToast.showToast(isValid);
                          },
                        ),
                        AddonsPage(
                          addons: addons,
                          dimensions: d,
                          appLocalizations: appLocalizations,
                          onPressed: (addons) {
                            log('addons: $addons');
                            goNext(context, 3);
                          },
                        ),
                        RequestSummaryPage(
                          dimensions: d,
                          addons: addons,
                          requestDetails: requestDetails,
                          appLocalizations: appLocalizations,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isDismissible: false,
                              builder:
                                  (context) => SuccessBottomSheet(
                                    title: appLocalizations.congrats,
                                    subTitle:
                                        appLocalizations
                                            .yourRequestSentSuccessfully,
                                    btnText: appLocalizations.continueWord,
                                    onPressed:
                                        () => context.go(HomeScreen.pageRoute),
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

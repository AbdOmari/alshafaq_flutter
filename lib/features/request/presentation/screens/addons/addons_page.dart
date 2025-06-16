import 'dart:developer';

import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/cubit/double_based_cubit.dart';
import 'package:ashafaq/config/shared/cubit/string_based_cubit.dart';
import 'package:ashafaq/config/shared/custom_loading_indicator.dart';
import 'package:ashafaq/config/shared/price_widget.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/request/data/models/addons/addons.dart';
import 'package:ashafaq/features/request/data/models/addons/order_extra/order_extra_to_json/order_extra_to_json.dart';
import 'package:ashafaq/features/request/data/models/addons/order_services/m_order_service_to_json.dart';
import 'package:ashafaq/features/request/domain/entities/order_extra.dart';
import 'package:ashafaq/features/request/domain/entities/order_service.dart';
import 'package:ashafaq/features/request/presentation/screens/addons/addons_cubit/addons_cubit.dart';
import 'package:ashafaq/features/request/presentation/widgets/addons/order_extra_card.dart';
import 'package:ashafaq/features/request/presentation/widgets/addons/extras_cubit/extras_cubit.dart';
import 'package:ashafaq/features/request/presentation/widgets/addons/order_service_card.dart';
import 'package:ashafaq/features/request/presentation/widgets/addons/services_cubit/services_cubit.dart';
import 'package:ashafaq/features/request/presentation/widgets/request_page_header_text.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddonsPage extends StatefulWidget {
  const AddonsPage({
    super.key,
    required this.addons,
    required this.appLocalizations,
    required this.dimensions,
    required this.onPressed,
  });
  final Addons addons;
  final AppLocalizations appLocalizations;
  final Dimensions dimensions;
  final void Function(Addons addons)? onPressed;

  @override
  State<AddonsPage> createState() => _AddonsPageState();
}

class _AddonsPageState extends State<AddonsPage> {
  //final addons = Addons();
  @override
  void initState() {
    context.read<ExtrasCubit>().getExtras();
    context.read<ServicesCubit>().getServices();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final appLocalizations = AppLocalizations.of(context)!;
    final extrasCubit = context.read<ExtrasCubit>();
    final servicesCubit = context.read<ServicesCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => DoubleBasedCubit(
                initialValue: widget.addons.getAddonsPrice(),
              ),
        ),
        BlocProvider(
          create:
              (context) => StringBasedCubit(
                initialValue: widget.addons.getAddonsString(),
              ),
        ),
      ],
      child: Builder(
        builder: (context) {
          final priceCubit = context.read<DoubleBasedCubit>();
          final stringAddonsCubit = context.read<StringBasedCubit>();
          return BlocConsumer<AddonsCubit, AddonsState>(
            listener: (context, state) {
              log('addons: screen state: //');
              if (state is FetchAddonsSuccessState) {
                extrasCubit.getExtras();
                servicesCubit.getServices();
              }
            },
            builder: (context, state) {
              if (state is AddonsLoadingState) {
                return const CustomLoadingIndicator();
              }
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //?addons part
                        const SizedBox(height: 20),
                        RequestPageHeaderText(text: appLocalizations.extras),
                        SizedBox(
                          height: height * .3,
                          child: BlocBuilder<ExtrasCubit, List<OrderExtra>>(
                            builder: (context, state) {
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: state.length,
                                itemBuilder: (context, index) {
                                  final item = state[index];
                                  return OrderExtraCard(
                                    initialValue:
                                        widget.addons.extras.firstWhere(
                                          (listItem) {
                                            return item.id == listItem.id;
                                          },
                                          orElse:
                                              () => const OrderExtraToJson(
                                                0,
                                                0,
                                                0.0,
                                                '',
                                              ),
                                        ).amount,
                                    extra: item,
                                    onChanged: (extra) {
                                      if (extra.amount == 0) {
                                        widget.addons.removeExtra(extra);
                                      } else {
                                        widget.addons.addExtra(extra);
                                      }
                                      priceCubit.getPrice(
                                        widget.addons.getAddonsPrice(),
                                      );

                                      stringAddonsCubit.getString(
                                        widget.addons.getAddonsString(),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        RequestPageHeaderText(text: appLocalizations.services),
                        SizedBox(
                          height: height * .3,
                          child: BlocBuilder<ServicesCubit, List<OrderService>>(
                            builder: (context, state) {
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: state.length,
                                itemBuilder: (context, index) {
                                  final item = state[index];
                                  final itemToJson = MOrderServiceToJson(
                                    item.id,
                                    item.price,
                                    item.name,
                                  );
                                  log(
                                    'addons services: ${widget.addons.services}',
                                  );
                                  final isSelected = widget.addons.services
                                      .contains(
                                        MOrderServiceToJson(
                                          item.id,
                                          item.price,
                                          item.name,
                                        ),
                                      );
                                  log('test: itemid: ${item.id} isIn: ');
                                  return OrderServiceCard(
                                    isSelected: isSelected,
                                    service: item,
                                    onChanged: (value) {
                                      if (value) {
                                        widget.addons.addService(itemToJson);
                                      } else {
                                        widget.addons.removeService(itemToJson);
                                      }
                                      priceCubit.getPrice(
                                        widget.addons.getAddonsPrice(),
                                      );
                                      stringAddonsCubit.getString(
                                        widget.addons.getAddonsString(),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(35),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<StringBasedCubit, String>(
                              builder: (context, addonString) {
                                return Text(
                                  addonString,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                );
                              },
                            ),
                            Column(
                              children: [
                                CustomElevatedButton(
                                  width: 100,
                                  btnColor: Colors.white,
                                  textColor: ColorsManger.primaryColor,
                                  text: widget.appLocalizations.confirm,
                                  onPressed:
                                      () =>
                                          widget.onPressed?.call(widget.addons),
                                ),
                                const SizedBox(height: 15),
                                BlocBuilder<DoubleBasedCubit, double>(
                                  builder: (context, totalPrice) {
                                    if (totalPrice == 0.0) {
                                      return const SizedBox();
                                    }
                                    return PriceWidget(
                                      price: totalPrice,
                                      priceColor: Colors.white,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/toast.dart';
import 'package:ashafaq/core/alignment/alignment_handler.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/cars/data/models/car_type.dart';
import 'package:ashafaq/features/cars/presentation/widgets/car_type_card.dart';
import 'package:ashafaq/config/shared/cubit/int_base_cubit.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCarType extends StatelessWidget {
  const SelectCarType({
    super.key,
    required this.d,
    required this.onSelect,
    required this.continueBtn,
  });

  final Dimensions d;
  final void Function(String)? onSelect;
  final void Function()? continueBtn;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Align(
            alignment: AlignmentHandler.centerLeft(context),
            child: Text(
              appLocalizations.selectCarType,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          BlocProvider(
            create: (context) => IntBaseCubit(initialValue: 5),
            child: Builder(
              builder: (context) {
                return BlocBuilder<IntBaseCubit, int>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(carsTypes.length, (index) {
                              final type = carsTypes[index];
                              return CarTypeWidget(
                                index: index,
                                currentIndex: state,
                                carType: type,
                                d: d,
                                onTap: () {
                                  onSelect?.call(type.name);
                                  context.read<IntBaseCubit>().chooseItem(
                                    index,
                                  );
                                },
                              );
                            }),
                          ],
                        ),

                        const SizedBox(height: 50),
                        BlocBuilder<IntBaseCubit, int>(
                          builder: (context, state) {
                            final enabled = state == 0 || state == 1;

                            return CustomElevatedButton(
                              text: appLocalizations.continueWord,
                              onPressed: () {
                                if (!enabled) {
                                  CustomToast.showToast(
                                    appLocalizations.selectCarType,
                                  );
                                  return;
                                }
                                continueBtn?.call();
                                return;
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

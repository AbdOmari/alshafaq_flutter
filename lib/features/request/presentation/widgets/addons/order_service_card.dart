import 'dart:developer';

import 'package:ashafaq/config/shared/cubit/bool_based_cubit.dart';
import 'package:ashafaq/config/shared/price_widget.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/core/alignment/alignment_handler.dart';
import 'package:ashafaq/features/request/domain/entities/order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderServiceCard extends StatelessWidget {
  const OrderServiceCard({
    super.key,
    this.isSelected,
    required this.service,
    required this.onChanged,
  });
  final bool? isSelected;
  final OrderService service;
  final Function(bool value)? onChanged;
  @override
  Widget build(BuildContext context) {
    log('test: isSelected: $isSelected');
    return BlocProvider(
      create: (context) => BoolBasedCubit(isSelected: isSelected),
      child: Builder(
        builder: (context) {
          final cubit = context.read<BoolBasedCubit>();
          return BlocConsumer<BoolBasedCubit, bool>(
            listener: (context, state) {
              log('service tapped: $state');
              onChanged?.call(state);
            },
            builder: (context, state) {
              return InkWell(
                onTap: () => cubit.change(),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.white,
                    border: BoxBorder.all(
                      color:
                          state
                              ? ColorsManger.primaryColor
                              : const Color(0xffEBEBEB),
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (state)
                        Align(
                          alignment: AlignmentHandler.topRight(context),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              color: ColorsManger.primaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(4),
                              ),
                            ),
                            child: const Icon(Icons.done, size: 12),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.all(16),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(service.image, height: 41, width: 41),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(service.name),
                                PriceWidget(price: service.price),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

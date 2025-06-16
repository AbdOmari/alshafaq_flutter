import 'package:ashafaq/config/shared/cubit/int_base_cubit.dart';
import 'package:ashafaq/features/home/presentation/widgets/slider/slider_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageSectionDots extends StatelessWidget {
  const PackageSectionDots({super.key, required this.nOfItems});

  final int nOfItems;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntBaseCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(nOfItems, (index) {
            return SliderDot(selected: index == state);
          }),
        );
      },
    );
  }
}

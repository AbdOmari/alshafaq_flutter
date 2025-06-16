import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key, required this.d});

  final Dimensions d;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          height: d.getComponentH(uiH: 220),
          width: d.getComponentW(uiW: 398),
          padding: const EdgeInsets.all(16),
          //margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: ColorsManger.borderColor),
            boxShadow: const [BoxShadow()],
          ),
        ),
      ),
    );
  }
}

import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/custom_network_image.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:flutter/material.dart';

class BasePackageCard extends StatelessWidget {
  const BasePackageCard({
    super.key,
    required this.imgUrl,
    required this.d,
    required this.content,
    this.backgroundColor = Colors.white,
  });
  final String imgUrl;
  final Widget content;
  final Dimensions d;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: d.getComponentH(uiH: 220),
      width: d.getComponentW(uiW: 398),
      padding: const EdgeInsets.all(16),
      //margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: ColorsManger.borderColor),
        boxShadow: const [BoxShadow()],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: CustomNetworkImage(
              imgUrl: imgUrl,
              d: d,
              assetPlaceholder: ImageManger.savingPackage,
              width: 103,
              height: 65.27,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(flex: 2, child: content),
        ],
      ),
    );
  }
}

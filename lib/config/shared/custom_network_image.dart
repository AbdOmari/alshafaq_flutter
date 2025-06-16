import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imgUrl,
    required this.assetPlaceholder,
    this.height,
    this.width,
    this.d,
  });

  final String imgUrl;
  final Dimensions? d;
  final String assetPlaceholder;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgUrl,
      width: _handleWidth(),
      height: _handleHeight(),
      fit: BoxFit.fill,
      errorBuilder:
          (context, error, stackTrace) => errorBuilderWidget(assetPlaceholder),
    );
  }

  Widget errorBuilderWidget(String imagePath) {
    if (imagePath.contains('.svg')) {
      return SvgPicture.asset(
        imagePath,
        width: _handleWidth(),
        height: _handleHeight(),
        fit: BoxFit.fill,
      );
    }
    return Image.asset(
      imagePath,
      width: _handleWidth(),
      height: _handleHeight(),
      fit: BoxFit.fill,
    );
  }

  double? _handleHeight() =>
      height == null
          ? null
          : d == null
          ? height
          : d!.getComponentH(uiH: height!);

  double? _handleWidth() =>
      width == null
          ? null
          : d == null
          ? width
          : d!.getComponentW(uiW: width!);
}

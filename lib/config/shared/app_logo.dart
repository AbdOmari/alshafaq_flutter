import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.height = 67, this.width = 125});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    final d = Dimensions(MediaQuery.of(context).size);
    return Image.asset(
      ImageManger.appLogo,
      height: d.getComponentH(uiH: 67),
      width: d.getComponentW(uiW: 125),
      fit: BoxFit.fill,
    );
  }
}

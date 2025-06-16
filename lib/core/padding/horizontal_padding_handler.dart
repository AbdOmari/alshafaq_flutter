import 'package:ashafaq/core/directions_handler/text_direction_handler.dart';
import 'package:flutter/widgets.dart';

final class HorizontalPaddingHandler {
  static EdgeInsetsGeometry leftPadding(BuildContext context, double padding) {
    final textDir = TextDirectionHandler.getDirection(context);
    if (textDir == TextDirection.ltr) {
      return EdgeInsets.only(left: padding);
    }
    return EdgeInsets.only(right: padding);
  }

  static EdgeInsetsGeometry leftTopPadding(BuildContext context, double lPadding,
    double tPadding,
  ) {
    final textDir = TextDirectionHandler.getDirection(context);
    if (textDir == TextDirection.ltr) {
      return EdgeInsets.only(left: lPadding,top: tPadding);
    }
    return EdgeInsets.only(right: lPadding, top: lPadding);
  }

  static EdgeInsetsGeometry rightPadding(BuildContext context, double padding) {
    final textDir = TextDirectionHandler.getDirection(context);
    if (textDir == TextDirection.ltr) {
      return EdgeInsets.only(right: padding);
    }
    return EdgeInsets.only(left: padding);
  }
}

//?idea of this class when we use alignment we set it to left or to right
//?based on the language but if we hard coded it we will be in trouble because
//?of if we are english alignment we use ltr but in arabic we use rtl
import 'package:ashafaq/core/directions_handler/text_direction_handler.dart';

import 'package:flutter/material.dart';

final class AlignmentHandler {
  static Alignment centerLeft(BuildContext context) {
    final dir = _getDir(context);
    if (dir == TextDirection.ltr) {
      return Alignment.centerLeft;
    }
    return Alignment.centerRight;
  }

  static Alignment centerRight(BuildContext context) {
    final dir = _getDir(context);
    if (dir == TextDirection.rtl) {
      return Alignment.centerLeft;
    }
    return Alignment.centerRight;
  }

  static Alignment topLeft(BuildContext context) {
    final dir = _getDir(context);
    if (dir == TextDirection.ltr) {
      return Alignment.topLeft;
    }
    return Alignment.topRight;
  }

  static Alignment bottomLeft(BuildContext context) {
    final dir = _getDir(context);
    if (dir == TextDirection.ltr) {
      return Alignment.bottomLeft;
    }
    return Alignment.bottomRight;
  }

  static Alignment topRight(BuildContext context) {
    final dir = _getDir(context);
    if (dir == TextDirection.rtl) {
      return Alignment.topLeft;
    }
    return Alignment.topRight;
  }

  static Alignment bottomRight(BuildContext context) {
    final dir = _getDir(context);
    if (dir == TextDirection.rtl) {
      return Alignment.bottomLeft;
    }
    return Alignment.bottomRight;
  }

  static TextDirection _getDir(BuildContext context) =>
      TextDirectionHandler.getDirection(context);
}

import 'package:flutter/material.dart';

final class Dimensions {
  static const double _designUiHeight = 1034.0;
  static const double __designUiWidth = 430.0;
  final Size _screenSize;
  const Dimensions(this._screenSize);

  Size getComponentSize({
    required double componentUiW,
    required double componentUiH,
  }) {    
    return Size(
      getComponentW(uiW: componentUiW),
      getComponentH(uiH: componentUiH),
    );
  }

  double getComponentH({String? from, required double uiH}) {
    final h = _screenSize.height * _getHFraction(uiH);
    return h;
  }

  double getComponentW({String? from, required double uiW}) {
    final w = _screenSize.width * _getWFraction(uiW);
    return w;
  }

  double _getWFraction(double uiW) => uiW / __designUiWidth;
  double _getHFraction(double uiH) => uiH / _designUiHeight;
}

import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.price,
    this.fontSize = 14,
    this.priceColor,
    this.isPrePrice = false,
    this.trailingText = '',
  });

  final double price;
  final double fontSize;
  final Color? priceColor;
  final bool isPrePrice;
  final String trailingText;
  int _calculateWidth() {
    int txtLen = price.toString().length;
    if (trailingText.isNotEmpty) {
      txtLen += trailingText.length;
    }
    return txtLen;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.green,
      width: _calculateWidth() < 6 ? 75 : 150,

      child: Stack(
        children: [
          if (isPrePrice)
            Container(
              margin: const EdgeInsets.only(top: 10, left: 3, right: 5),
              width: fontSize > 10 ? 60 : 40,
              height: 2,
              color: priceColor,
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageManger.rial,
                width: 12,
                height: 13,
                color: priceColor,
              ),
              const SizedBox(width: 3),
              Text(
                '$price $trailingText',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: priceColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

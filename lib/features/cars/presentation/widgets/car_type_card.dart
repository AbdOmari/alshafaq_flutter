import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/core/alignment/alignment_handler.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/cars/data/models/car_type.dart';
import 'package:flutter/material.dart';

class CarTypeWidget extends StatelessWidget {
  const CarTypeWidget({
    super.key,
    required this.d,
    required this.index,
    required this.currentIndex,
    required this.carType,
    required this.onTap,
  });

  final Dimensions d;
  final int index;
  final int currentIndex;
  final CarType carType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final selected = index == currentIndex;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: d.getComponentW(uiW: 189),
        height: 141,

        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: BoxBorder.all(
            color:
                selected ? ColorsManger.primaryColor : const Color(0xffEBEBEB),
          ),
        ),
        child: Stack(
          children: [
            if (selected)
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
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(carType.imgUrl, height: 61, width: 61),
                  const SizedBox(height: 10),
                  Text(carType.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

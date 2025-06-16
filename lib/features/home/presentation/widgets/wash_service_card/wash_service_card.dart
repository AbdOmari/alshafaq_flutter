import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/home/domain/entities/wash_service/wash_service.dart';
import 'package:flutter/material.dart';

class WashServiceCard extends StatelessWidget {
  const WashServiceCard({
    super.key,
    required this.d,
    required this.selected,
    required this.onTap,
    required this.item,
  });

  final Dimensions d;
  final bool selected;
  final void Function()? onTap;

  final WashService item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: d.getComponentH(uiH: 68),
        width: d.getComponentW(uiW: 120),
        decoration: BoxDecoration(
          color: selected ? ColorsManger.primaryColor : Colors.white,
          border: BoxBorder.all(color: const Color(0xff2E93B9)),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item.image,
              height: 32,
              width: 32,
              fit: BoxFit.fill,
              color: selected ? Colors.white : ColorsManger.primaryColor,
            ),
            const SizedBox(height: 5),
            Text(
              item.name,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : ColorsManger.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

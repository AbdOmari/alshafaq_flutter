import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.hour,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });
  final int selectedIndex;
  final int index;
  final String hour;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final selected = index == selectedIndex;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: selected ? ColorsManger.primaryColor : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(70)),
          border: Border.all(
            width: 1,
            color: selected ? ColorsManger.primaryColor : Colors.grey,
          ),
        ),
        child: Text(
          hour,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

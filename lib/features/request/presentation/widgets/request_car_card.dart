import 'package:ashafaq/features/cars/domain/entities/car.dart';
import 'package:flutter/material.dart';

class RequestCarCard extends StatelessWidget {
  const RequestCarCard({
    super.key,
    required this.car,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  final Car car;
  final int index;
  final int selectedIndex;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),

        height: 63,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: isSelected ? Colors.black : const Color(0x53000000),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Image.network(car.image, width: 60, height: 40, fit: BoxFit.cover),
            const SizedBox(width: 10),
            Text('${car.characters} ${car.number}'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SliderDot extends StatelessWidget {
  const SliderDot({super.key, required this.selected});
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.centerLeft,
    
      height: 7,
      width: selected ? 32 : 7,
      decoration: BoxDecoration(
        color: selected ? const Color(0xffFFC436) : const Color(0xffFFF0CE),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}

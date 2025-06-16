import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({super.key, required this.content, this.onPressed});

  final Widget content;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      width: double.infinity,

      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(45, 0, 0, 0),
            offset: Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 10,
          ),
        ],
      ),
      child: content,
    );
  }
}

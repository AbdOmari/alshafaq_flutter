import 'dart:developer';

import 'package:ashafaq/config/shared/cubit/add_remove_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRemoveWidget extends StatelessWidget {
  const AddRemoveWidget({super.key, this.initialValue, required this.onTap});
  final int? initialValue;
  final Function(int value)? onTap;
  @override
  Widget build(BuildContext context) {
    log('test: initial value: $initialValue');
    return BlocProvider(
      create: (context) => AddRemoveCubit(initialValue: initialValue),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AddRemoveCubit>();
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: IconButton(
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      cubit.decrement();
                      onTap?.call(cubit.state);
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: BlocBuilder<AddRemoveCubit, int>(
                    builder: (context, state) {
                      return Text('$state');
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      cubit.increment();
                      onTap?.call(cubit.state);
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

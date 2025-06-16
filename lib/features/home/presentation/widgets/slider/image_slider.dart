import 'package:ashafaq/config/shared/cubit/int_base_cubit.dart';
import 'package:ashafaq/features/home/domain/entities/i_banner.dart';
//import 'package:ashafaq/features/home/presentation/widgets/slider/cubit/image_slider_cubit.dart';
import 'package:ashafaq/features/home/presentation/widgets/slider/custom_slider.dart';
import 'package:ashafaq/features/home/presentation/widgets/slider/slider_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannersSlider extends StatelessWidget {
  const BannersSlider({
    super.key,
    required this.height,
    required this.width,
    required this.banners,
  });
  final double height;
  final double width;
  final List<IBanner> banners;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntBaseCubit(),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              CustomSlider(
                height: height,
                items: List.generate(
                  banners.length,
                  (index) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      banners[index].imageUrl,
                      fit: BoxFit.cover,
                      width: width,
                      height: height,
                    ),
                  ),
                ),
                onPageChanged:
                    (index, _) =>
                        context.read<IntBaseCubit>().chooseItem(index),
              ),
              const SizedBox(height: 10),
              BlocBuilder<IntBaseCubit, int>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(banners.length, (index) {
                      return SliderDot(selected: index == state);
                    }),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/buttons/custom_icon_button.dart';
import 'package:ashafaq/config/shared/custom_network_image.dart';
import 'package:ashafaq/features/cars/domain/entities/car.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car});
  final Car car;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageManger.carPlate, height: 93, width: 173),
          //CarNetworkImage(car: car, height: 93, width: 173),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: CarNetworkImage(car: car),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    car.characters,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomIconButton(icon: Icons.edit, onPressed: () {}),
                  const SizedBox(width: 10),
                  CustomIconButton(
                    icon: Icons.delete,
                    iconColor: Colors.red,
                    iconBackgroundColor: const Color(0xffFFEEEE),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CarNetworkImage extends StatelessWidget {
  const CarNetworkImage({
    super.key,
    required this.car,
    this.height = 61,
    this.width = 66,
  });

  final Car car;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imgUrl: car.image,
      assetPlaceholder:
          car.modelText.toLowerCase() == 'suv'
              ? ImageManger.car1
              : ImageManger.car2,
      height: height,
      width: width,
    );
  }
}

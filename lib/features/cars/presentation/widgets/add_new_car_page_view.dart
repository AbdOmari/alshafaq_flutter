import 'dart:developer';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/cars/data/models/m_car.dart';
import 'package:ashafaq/features/cars/presentation/widgets/select_car_details.dart';
import 'package:ashafaq/features/cars/presentation/widgets/select_car_type.dart';
import 'package:flutter/material.dart';

class AddNewCarPageView extends StatefulWidget {
  const AddNewCarPageView({super.key});

  @override
  State<AddNewCarPageView> createState() => _AddNewCarPageViewState();
}

class _AddNewCarPageViewState extends State<AddNewCarPageView> {
  final _pageController = PageController();
  final _carCreator = CarCreator();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final d = Dimensions(MediaQuery.of(context).size);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),

          children: [
            SelectCarType(
              d: d,
              onSelect: (type) => _carCreator.modelText = type,
              continueBtn: () {
                //?this moves to page2
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
            ),
            SizedBox.expand(
              child: SelectCarDetails(
                carCreator: _carCreator,
                goBack:
                    () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                    ),
                onCompleted: (name, number, city) {
                  //?call add car endpoint.

                  log('name: $name');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

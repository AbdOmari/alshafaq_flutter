import 'dart:developer';
import 'package:ashafaq/config/shared/custom_loading_indicator.dart';
import 'package:ashafaq/features/cars/presentation/screens/add_new_car_screen.dart';
import 'package:ashafaq/features/cars/presentation/screens/bloc/cars_bloc.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/layout/drawer_page_base_layout.dart';
import 'package:ashafaq/features/cars/presentation/widgets/car_card.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});
  static const pageRoute = '/cars-screen';

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  @override
  void initState() {
    context.read<CarsBloc>().add(const GetMyCarsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return DrawerPageBaseLayout(
      title: appLocalizations.userCars,
      content: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                BlocBuilder<CarsBloc, CarsState>(
                  builder: (context, state) {
                    log('cars bloc: state: $state');
                    if (state is CarsLoadingState) {
                      return const CustomLoadingIndicator();
                    }
                    if (state is GotMyCarsState) {
                      return Column(
                        children:
                            state.cars.map((car) => CarCard(car: car)).toList(),
                      );
                    } else if (state is NoCarsState) {
                      return const Center(child: Text('no cars'));
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
          Positioned(
            bottom: 20,

            child: CustomElevatedButton(
              text: '+ ${appLocalizations.addNewCar}',
              btnColor: const Color(0xFFB2E4F6),
              textColor: Colors.black,
              onPressed: () => context.push(AddNewCarScreen.pageRoute),
            ),
          ),
        ],
      ),
    );
  }
}

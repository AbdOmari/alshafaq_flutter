import 'dart:developer';

import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/maps/cubit/map_cubit.dart';
import 'package:ashafaq/config/shared/maps/location_picker_screen.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/cars/presentation/screens/cars_screen.dart';
import 'package:ashafaq/config/shared/cubit/int_base_cubit.dart';
import 'package:ashafaq/features/request/data/models/location/order_location.dart';
import 'package:ashafaq/features/request/data/models/request_details/request_details.dart';
import 'package:ashafaq/features/request/presentation/widgets/calendar/custom_calender.dart';
import 'package:ashafaq/features/request/presentation/widgets/location_card.dart';
import 'package:ashafaq/features/request/presentation/widgets/request_single_package_card.dart';
import 'package:ashafaq/features/request/presentation/widgets/request_page_header_text.dart';
import 'package:ashafaq/features/request/presentation/widgets/request_sub_title.dart';
import 'package:ashafaq/features/request/presentation/widgets/time_widget.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RequestDetailsPage extends StatelessWidget {
  const RequestDetailsPage({
    super.key,
    required this.appLocalizations,
    required this.requestDetails,
    required this.dimensions,

    required this.onPressed,
  });
  final AppLocalizations appLocalizations;
  final Dimensions dimensions;
  final RequestDetails requestDetails;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RequestPageHeaderText(text: appLocalizations.addRequest),
                const Expanded(flex: 4, child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: CustomElevatedButton(
                    text: appLocalizations.addNewCar,
                    btnTextSize: 9,
                    height: 50,
                    onPressed: () => context.push(CarsScreen.pageRoute),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            RequestSinglePackageCard(
              package: requestDetails.package,
              d: dimensions,
            ),
            const SizedBox(height: 15),
            RequestSubTitle(title: appLocalizations.carWashingService),

            const SizedBox(height: 5),

            // SizedBox(
            //   height: 100,
            //   child: BlocProvider(
            //     create: (context) => IntBaseCubit(),
            //     child: Builder(
            //       builder: (context) {
            //         final intCubit = context.read<IntBaseCubit>();
            //         return ListView(
            //           scrollDirection: Axis.horizontal,
            //           children: List.generate(cars.length, (index) {
            //             final car = cars[index];
            //             return BlocConsumer<IntBaseCubit, int>(
            //               listener:
            //                   (context, state) => requestDetails.car = car,
            //               builder: (context, state) {
            //                 return RequestCarCard(
            //                   car: car,
            //                   index: index,
            //                   selectedIndex: state,
            //                   onTap: () {
            //                     intCubit.chooseItem(index);
            //                   },
            //                 );
            //               },
            //             );
            //           }),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            const SizedBox(height: 15),
            //?calender
            CustomCalendar(
              onSelect: (date) {
                log('calendar called the onSelect: $date');
                requestDetails.dateTime.date = date;
              },
            ),
            const SizedBox(height: 15),
            RequestSubTitle(title: appLocalizations.pickTime),
            const SizedBox(height: 5),
            SizedBox(
              height: 50,
              child: BlocProvider(
                create: (context) => IntBaseCubit(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final hour = '0$index:00AM';
                    final hoursCubit = context.read<IntBaseCubit>();
                    return BlocConsumer<IntBaseCubit, int>(
                      listener:
                          (context, state) =>
                              requestDetails.dateTime.time = hour,
                      builder: (context, state) {
                        return TimeWidget(
                          index: index,
                          selectedIndex: state,
                          hour: hour,
                          onTap: () {
                            hoursCubit.chooseItem(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            //?location google map
            BlocProvider(
              create: (context) => MapCubit(),
              child: Builder(
                builder: (context) {
                  final mapCubit = context.read<MapCubit>();
                  return Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          final selectedLocation = await context
                              .push<MapLocation?>(
                                LocationPickerScreen.pageRoute,
                                extra: mapCubit.state,
                              );
                          // ignore: use_build_context_synchronously
                          context.read<MapCubit>().chooseLocation(
                            selectedLocation,
                          );
                        },
                        child: Image.asset(ImageManger.map),
                      ),
                      const SizedBox(height: 10),
                      BlocConsumer<MapCubit, MapLocation?>(
                        listener: (context, state) {
                          if (state != null) {
                            requestDetails.location = OrderLocation(
                              state.position,
                              state.name,
                            );
                            return;
                          }
                        },
                        builder: (context, state) {
                          return LocationCard(
                            onPressed: null,
                            appLocalizations: appLocalizations,
                            location: state?.name,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),

            //?continuo button.
            const SizedBox(height: 20),
            CustomElevatedButton(
              text: appLocalizations.confirm,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

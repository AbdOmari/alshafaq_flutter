import 'package:ashafaq/config/shared/buttons/custom_outlined_button.dart';
import 'package:ashafaq/config/shared/maps/cubit/map_cubit.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key, required this.mapCubit});
  static const pageRoute = '/location-picker-screen';
  final MapCubit mapCubit;
  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  LatLng? selectedLocation;
  GoogleMapController? mapController;
  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //_onMapTapped(widget.initialLocation!.position);

    super.initState();
  }

  Placemark? placemark;
  LatLng? selectedPosition;
  void _onMapTapped(LatLng position) async {
    selectedPosition = position;
    List<Placemark> placeMarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (mounted) {
      if (placeMarks.isNotEmpty) {
        placemark = placeMarks[0];
        final mapLocation = MapLocation(
          name: placemark!.name!,
          position: position,
          street: placemark!.street!,
          locality: placemark!.locality!,
          administrativeArea: placemark!.administrativeArea!,
          country: placemark!.country!,
        );
        widget.mapCubit.chooseLocation(mapLocation);
      } else if (placeMarks.isEmpty) {
        widget.mapCubit.chooseLocation(null);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.of(context).size;
    final d = Dimensions(screenSize);
    return BlocProvider.value(
      value: widget.mapCubit,
      child: BlocBuilder<MapCubit, MapLocation?>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target:
                        state?.position ??
                        const LatLng(
                          24.7136,
                          46.6753,
                        ), // Default: Riyadh, Saudi Arabia
                    zoom: 12,
                  ),
                  onMapCreated: (controller) {
                    mapController = controller;
                  },
                  onTap: _onMapTapped,
                  markers:
                      state?.position != null
                          ? {
                            Marker(
                              markerId: const MarkerId('selected-location'),
                              position: state!.position,
                            ),
                          }
                          : {},
                ),
          
                Visibility(
                  visible: state != null,
                  child: Positioned(
                    bottom: 50,
                    left:
                        (screenSize.width / 2) -
                        (d.getComponentW(uiW: 380) / 2),
                    child: Container(
                      width: d.getComponentW(uiW: 380),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(234, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appLocalizations.selectedLocation,
                            style: const TextStyle(
                              fontSize: 16,
                              color: ColorsManger.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          SelectedLocationTextWidget(location: state),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: CustomOutlinedButton(
                                  btnLabel: appLocalizations.cancel,
                                  height: 50,
                                  onPressed: () {
                                    widget.mapCubit.chooseLocation(null);
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomOutlinedButton(
                                  btnLabel: appLocalizations.confirm,
                                  fillColor: ColorsManger.primaryColor,
                                  txtColor: Colors.white,
                                  height: 50,
                                  onPressed: () {
                                    context.pop(state);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

class SelectedLocationTextWidget extends StatelessWidget {
  const SelectedLocationTextWidget({super.key, required this.location});
  final MapLocation? location;
  @override
  Widget build(BuildContext context) {
    return Text(
      location!.locationAddress ?? '',
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 10),
    );
  }
}

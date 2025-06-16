import 'dart:developer';
import 'dart:math' as math;
import 'package:ashafaq/config/resources/image_manger.dart';
import 'package:ashafaq/config/shared/bottom_sheet/success_bottom_sheet.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/custom_loading_indicator.dart';
import 'package:ashafaq/config/shared/layout/drawer_page_base_layout.dart';
import 'package:ashafaq/config/shared/maps/cubit/map_cubit.dart';
import 'package:ashafaq/config/shared/maps/location_picker_screen.dart';
import 'package:ashafaq/config/shared/text_field/custom_text_from_field.dart';
import 'package:ashafaq/config/shared/toast.dart';
import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/features/locations/domain/entities/i_zone.dart';
import 'package:ashafaq/features/locations/presentation/screens/location_validator.dart';
import 'package:ashafaq/features/locations/presentation/screens/locations_cubit/locations_cubit.dart';
import 'package:ashafaq/features/locations/presentation/screens/zones_cubit/zones_cubit.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});
  static const pageRoute = '/add-location-page';

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  final _locationValidator = LocationValidator();
  void getData() {
    context.read<ZonesCubit>().getZones();
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  void dispose() {
    _locationValidator.nameValidator.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return DrawerPageBaseLayout(
      title: appLocalizations.add(appLocalizations.newLocation),
      content: BlocConsumer<LocationsCubit, LocationsState>(
        listener: (context, state) {
          if (state is AddedLocationState) {
            context.read<LocationsCubit>().getLocations();
            showModalBottomSheet(
              context: context,
              enableDrag: false,
              isDismissible: false,
              builder:
                  (_) => SuccessBottomSheet(
                    title: appLocalizations.congrats,
                    subTitle: appLocalizations.locationAddedSuccessfully,
                    btnText: appLocalizations.continueWord,
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.pop();
                    },
                  ),
            );
          } else if (state is LocationsErrorState) {
            CustomToast.showToast(state.error);
            return;
          }
        },
        builder: (context, state) {
          if (state is LocationsLoadingState) {
            return const CustomLoadingIndicator();
          }

          return Form(
            key: _locationValidator.formValidator.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFromField(
                    label: appLocalizations.name,
                    kbInputType: TextInputType.text,
                    preIcon: Icons.abc,
                    validator:
                        (value) => _locationValidator.nameValidator
                            .validateName(context, value: value),
                    onFieldSubmitted:
                        (value) =>
                            _locationValidator.formValidator.validateForm(),
                  ),
                  const SizedBox(height: 20),
                  //?zones part
                  BlocBuilder<ZonesCubit, ZonesState>(
                    builder: (context, state) {
                      if (state is GotZonesState) {
                        final zones = state.zones;
                        return ZonesDropDownButton(
                          hint: Text(
                            appLocalizations.zones,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          zones: zones,
                          validator:
                              (zone) =>
                                  _locationValidator.zoneValidator.validateName(
                                    context,
                                    value: zone?.name,
                                    fieldName: appLocalizations.zone,
                                  ),
                          onChanged: (zone) {
                            _locationValidator.zone = zone;
                          },
                        );
                      }
                      if (state is ZonesLoadingState) {
                        return const ZonesDropDownButton(
                          hint: CustomLoadingIndicator(widgetHeight: 40),
                          expand: false,
                          zones: [],
                          validator: null,
                          onChanged: null,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(height: 20),
                  //?map cubit and pick location.
                  BlocProvider(
                    create: (context) => MapCubit(),
                    child: Builder(
                      builder: (context) {
                        final mapCubit = context.read<MapCubit>();
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: BlocConsumer<MapCubit, MapLocation?>(
                                listener: (context, state) {
                                  if (state != null) {
                                    _locationValidator.latLng = state.position;
                                    _locationValidator.notes =
                                        state.locationAddress;
                                  }
                                },
                                builder: (context, state) {
                                  return Container(
                                    height: 53,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: BoxBorder.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(13),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Expanded(
                                          child: Icon(
                                            Icons.add_location,
                                            color: ColorsManger.primaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: Text(
                                            //maxLines: 2,
                                            textAlign: TextAlign.start,
                                            state?.locationAddress ??
                                                appLocalizations.location,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(fontSize: 9),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                context.push(
                                  LocationPickerScreen.pageRoute,
                                  extra: mapCubit,
                                );
                              },
                              child: Container(
                                width: 53,
                                height: 53,
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: ColorsManger.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(13),
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  ImageManger.mapIcon,
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomElevatedButton(
                    text: appLocalizations.save,
                    onPressed: () {
                      final isValid =
                          _locationValidator.formValidator.validateForm();
                      if (isValid) {
                        _locationValidator.name =
                            _locationValidator.nameValidator.name;
                        final canCreate = _locationValidator.validate(context);
                        if (canCreate != null) {
                          log('can create: $canCreate');
                          CustomToast.showToast(canCreate);
                          return;
                        }
                        context.read<LocationsCubit>().addLocation(
                          _locationValidator.create(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ZonesDropDownButton extends StatelessWidget {
  const ZonesDropDownButton({
    super.key,
    required this.hint,
    required this.zones,
    this.expand = true,
    required this.validator,
    required this.onChanged,
  });
  final Widget hint;
  final List<IZone> zones;
  final String? Function(IZone?)? validator;
  final bool expand;
  final void Function(IZone? zone)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: expand,
      hint: hint,
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.white,
        filled: true,
        labelStyle: Theme.of(context).textTheme.labelMedium,

        border: _border(),
        //?border when the field is enabled
        enabledBorder: _focusedBorder(),
        //?when we focus to write in the field
        focusedBorder: _focusedBorder(),
        //?when error and not focused
        errorBorder: _border(color: Colors.red),
        //?when the field not enabled
        disabledBorder: _border(color: Colors.grey),
        //?focused and error.
        focusedErrorBorder: _focusedBorder(color: Colors.red),
      ),
      icon: Transform.rotate(
        angle: math.pi / 2,
        child: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
      validator: validator,
      items:
          zones
              .map(
                (zone) => DropdownMenuItem(
                  value: zone,
                  child: Text(
                    zone.name,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(fontSize: 14),
                  ),
                ),
              )
              .toList(),
      onChanged: onChanged,
    );
  }

  InputBorder _focusedBorder({
    Color color = const Color(0xff1A1E51),
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: width, color: color),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }

  InputBorder _border({
    color = const Color.fromARGB(88, 158, 158, 158),
    double width = .0,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: width, color: color),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }
}

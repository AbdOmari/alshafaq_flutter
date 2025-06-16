import 'dart:developer';

import 'package:ashafaq/config/shared/bottom_sheet/success_bottom_sheet.dart';
import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/custom_loading_indicator.dart';
import 'package:ashafaq/config/shared/drawer/components/app_bar_leading_arrow.dart';
import 'package:ashafaq/config/shared/image_picker/image_picker_field.dart';
import 'package:ashafaq/config/shared/text_field/custom_text_from_field.dart';
import 'package:ashafaq/config/shared/toast.dart';
import 'package:ashafaq/core/alignment/alignment_handler.dart';
import 'package:ashafaq/features/cars/data/models/m_car.dart';
import 'package:ashafaq/features/cars/domain/validators/car_details_validator.dart';
import 'package:ashafaq/features/cars/presentation/screens/bloc/cars_bloc.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectCarDetails extends StatelessWidget {
  const SelectCarDetails({
    super.key,
    required this.carCreator,
    required this.goBack,
    required this.onCompleted,
  });
  static final _validator = CarDetailsValidator();
  final CarCreator carCreator;
  final void Function()? goBack;

  final void Function(String name, String number, String city)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      physics: const AlwaysScrollableScrollPhysics(),

      child: Form(
        key: _validator.formValidator.formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: AlignmentHandler.centerLeft(context),
              child: AppBarLeadingArrow(onTap: goBack),
            ),
            const SizedBox(height: 40),
            BlocConsumer<CarsBloc, CarsState>(
              listener: (context, state) {
                if (state is CarsFailureState) {
                  CustomToast.showToast(state.error);
                  return;
                }
                if (state is AddedCarState) {
                  context.read<CarsBloc>().add(const GetMyCarsEvent());
                  showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    isDismissible: false,
                    builder:
                        (_) => SuccessBottomSheet(
                          title: appLocalizations.congrats,
                          subTitle:
                              appLocalizations.carAddedSuccessfully,
                          btnText: appLocalizations.continueWord,
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.pop();
                          },
                        ),
                  );
                }
              },
              builder: (context, state) {
                log('car state: $state');
                if (state is CarsLoadingState) {
                  return const CustomLoadingIndicator();
                }
                return Column(
                  children: [
                    ImagePickerField(
                      label: appLocalizations.selectYouCarImage,
                      onCompleted: (image) {
                        carCreator.image = image;
                      },
                    ),
                    //?color
                    CustomTextFromField(
                      label: appLocalizations.color,
                      kbInputType: TextInputType.name,
                      preIcon: Icons.text_fields,
                      validator:
                          (value) => _validator.colorValidator.validateName(
                            context,
                            value: value,
                            fieldName: appLocalizations.color,
                          ),
                      onFieldSubmitted:
                          (value) => _validator.formValidator.validateForm(),
                    ),
                    //?city
                    CustomTextFromField(
                      label: appLocalizations.city,
                      kbInputType: TextInputType.name,
                      preIcon: Icons.text_fields,
                      validator:
                          (value) => _validator.cityValidator.validateName(
                            context,
                            value: value,
                            fieldName: appLocalizations.city,
                          ),
                      onFieldSubmitted:
                          (value) => _validator.formValidator.validateForm(),
                    ),
                    //?name
                    CustomTextFromField(
                      label: appLocalizations.name,
                      kbInputType: TextInputType.name,
                      preIcon: Icons.text_fields,
                      validator:
                          (value) => _validator.carNameValidator.validateName(
                            context,
                            value: value,
                          ),
                      onFieldSubmitted:
                          (value) => _validator.formValidator.validateForm(),
                    ),
                    //?numbers
                    CustomTextFromField(
                      label: appLocalizations.platNumber,
                      kbInputType: TextInputType.number,
                      preIcon: Icons.numbers,
                      validator:
                          (value) => _validator.platNumbersValidator
                              .validateNumber(context, value: value),
                      onFieldSubmitted:
                          (value) => _validator.formValidator.validateForm(),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
            CustomElevatedButton(
              text: appLocalizations.save,
              onPressed: () {
                final isValid =
                    _validator.formValidator.formKey.currentState!.validate();
                if (isValid) {
                  carCreator.colorText = _validator.colorValidator.name;
                  carCreator.characters = _validator.carNameValidator.name;
                  carCreator.number = _validator.platNumbersValidator.number;

                  carCreator.cityAr = _validator.cityValidator.name;
                  final isValid = carCreator.validate(context);
                  log('car creator: $carCreator');
                  if (isValid != null) {
                    CustomToast.showToast(isValid);
                    return;
                  }
                  if (isValid == null) {
                    final car = carCreator.create(context);
                    context.read<CarsBloc>().add(
                      AddCarEvent(car!, carCreator.image!),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

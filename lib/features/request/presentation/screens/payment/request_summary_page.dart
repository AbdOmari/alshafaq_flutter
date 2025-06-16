import 'package:ashafaq/config/shared/buttons/custom_elevated_button.dart';
import 'package:ashafaq/config/shared/price_widget.dart';
import 'package:ashafaq/core/sizes/dimensions.dart';
import 'package:ashafaq/features/request/data/models/addons/addons.dart';
import 'package:ashafaq/features/request/data/models/request_details/request_details.dart';
import 'package:ashafaq/features/request/presentation/widgets/location_card.dart';
import 'package:ashafaq/features/request/presentation/widgets/request_car_card.dart';
import 'package:ashafaq/features/request/presentation/widgets/request_page_header_text.dart';
import 'package:ashafaq/features/request/presentation/widgets/request_single_package_card.dart';
import 'package:ashafaq/features/request/presentation/widgets/request_sub_title.dart';
import 'package:ashafaq/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RequestSummaryPage extends StatelessWidget {
  const RequestSummaryPage({
    super.key,
    required this.appLocalizations,
    required this.dimensions,
    required this.addons,
    required this.requestDetails,
    required this.onPressed,
  });
  final AppLocalizations appLocalizations;
  final RequestDetails requestDetails;
  final Addons addons;
  final Dimensions dimensions;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RequestPageHeaderText(text: appLocalizations.requestSummary),
          const SizedBox(height: 10),
          RequestSinglePackageCard(
            package: requestDetails.package,
            d: dimensions,
          ),
          const SizedBox(height: 10),
          RequestCarCard(
            car: requestDetails.car!,
            onTap: null,
            index: 0,
            selectedIndex: 1,
          ),
          const SizedBox(height: 10),
          LocationCard(
            appLocalizations: appLocalizations,
            onPressed: null,
            location: requestDetails.location!.name,
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                RequestSubTitle(title: appLocalizations.appointment),
                const SizedBox(height: 10),
                DateItem(
                  label: appLocalizations.date,
                  value: requestDetails.dateTime.dateString(),
                ),
                const SizedBox(height: 5),
                DateItem(
                  label: appLocalizations.time,
                  value: requestDetails.dateTime.time!,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appLocalizations.total, style: _txtStyle()),
                PriceWidget(
                  price: addons.getAddonsPrice() + requestDetails.package.price,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          CustomElevatedButton(
            text: appLocalizations.confirm,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class DateItem extends StatelessWidget {
  const DateItem({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: _txtStyle()),
        Text(value, style: _txtStyle()),
      ],
    );
  }
}

TextStyle _txtStyle() {
  return const TextStyle(fontSize: 12, color: Color(0x82000000));
}

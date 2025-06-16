import 'package:ashafaq/features/cars/domain/entities/car.dart';
import 'package:ashafaq/features/home/domain/entities/packages/package.dart';
import 'package:ashafaq/features/request/data/models/date/order_date_time.dart';
import 'package:ashafaq/features/request/data/models/location/order_location.dart';
import 'package:ashafaq/l10n/app_localizations.dart';

final class RequestDetails {
  final Package package;
  Car? car;
  OrderDateTime dateTime = OrderDateTime();
  OrderLocation? location;

  RequestDetails(this.package);

  String? isValid(AppLocalizations appLocalizations) {
    if (car == null) {
      return appLocalizations.selectCarType;
    }

    if (location == null) {
      return appLocalizations.selectLocation;
    }
    if (dateTime.date == null) {
      return appLocalizations.selectDate;
    }
    if (dateTime.time == null) {
      return appLocalizations.selectTime;
    }
    return null;
  }

  @override
  String toString() {
    return 'car: $car package: $package date: $dateTime location: $location';
  }
}

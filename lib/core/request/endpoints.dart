import 'package:flutter_dotenv/flutter_dotenv.dart';

final _base = dotenv.env['BASE_API'] ?? '';
final _catalog = '$_base/catalog';
final _user = '$_base/user';
final _auth = '$_base/user/auth';
final addons = '$_base/catalog/addons';
final registerEndPoint = '$_auth/register';
final loginEndPoint = '$_auth/login';
final sendOtpEndPoint = '$_auth/request-otp';
final verifyPhoneEndPoint = '$_auth/verify-phone';
final resendOtpEndPoint = '$_auth/resend-otp';
final addonsEndPoint = addons;

final class LocationsUrls {
  static final addresses = '$_base/user/addresses';

  static final zones = '$_base/catalog/zones';

  static final cities = '$_base/catalog/cities';
}

final class PackagesUrls {
  static final _packageBase = '$_catalog/packages';
  static final single = '$_packageBase/single';
  static final saving = '$_packageBase/all';
  static final package5 = _packageBase;
  //static final allPackages = '$_packageBase/';
}

final class CarUrls {
  static final _carsBase = '$_user/cars';
  static final carsUrl = _carsBase;
}

final class CatalogUrls {
  static final banners = '$_catalog/banners';
}

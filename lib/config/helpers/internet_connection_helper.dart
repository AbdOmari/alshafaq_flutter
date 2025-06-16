import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final class InternetConnectionHelper {
   Future<bool> isConnectedToInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    final internetConnectionChecker =
        InternetConnectionChecker.createInstance();

    if (connectivityResult.first == ConnectivityResult.none) {
      return false;
    }
    return await internetConnectionChecker.hasConnection;
  }
}

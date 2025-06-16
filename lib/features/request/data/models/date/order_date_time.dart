import 'package:ashafaq/core/constants/json_keys.dart';

class OrderDateTime {
   DateTime? date;
   String? time;

  String dateString() => '${date!.year}-${date!.month}-${date!.day}';
  String _stringTime() => time!.substring(0, time!.length - 2);
  Map<String, dynamic> toJson() => {
    JsonKeys.data: '${dateString()} ${_stringTime()}',
  };

  @override
  String toString() {
    return 'date: ${dateString()} time: ${_stringTime()}';
  }
}

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {

  String get toKR {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
  }

}
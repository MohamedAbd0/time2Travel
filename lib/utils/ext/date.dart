import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormatApiDate() {
    return DateFormat("yyyy-MM-dd").format(this);
  }
}

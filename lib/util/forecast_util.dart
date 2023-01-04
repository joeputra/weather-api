import 'package:intl/intl.dart';

class Util {
  static String appId = "982ac877c5afab8ab3860efb57b38e77";

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat('EEE, MMM d, ' 'y').format(dateTime);
  }
}

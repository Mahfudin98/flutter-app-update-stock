// ignore: import_of_legacy_library_into_null_safe
import 'package:timeago/timeago.dart' as timeago;

class TimeFormatCustom {
  String convertToAgo(String time) {
    timeago.setLocaleMessages('id', timeago.IdMessages());
    final DateTime time1 = DateTime.parse(time);
    return timeago.format(time1, locale: 'id');
  }
}

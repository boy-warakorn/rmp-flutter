import 'package:intl/intl.dart';

const _format = "yyyy-MM-dd kk:mm";

String formattedDate(String date) {
  final dateFormat = DateFormat(_format);
  return dateFormat.format(DateTime.parse(date)).toString();
}

String getDateTimeString(DateTime dateTime){
  return DateFormat(_format).format(dateTime);
}

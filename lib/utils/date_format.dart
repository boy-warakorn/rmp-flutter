import 'package:intl/intl.dart';

String formattedDate(String date) {
  final dateFormat = DateFormat('yyyy-MM-dd');
  return dateFormat.format(DateTime.parse(date)).toString();
}

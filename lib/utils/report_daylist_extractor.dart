import 'package:rmp_flutter/configs/week_days.dart';
import 'package:rmp_flutter/widgets/interactions/week_day_checkbox.dart';

List<WeekDay> extractAvailableDaysFromString(String availableDay) {
  var result = <WeekDay>[];
  var keys = dayName.keys.toList();
  for (WeekDay day in keys) {
    if (availableDay.contains(dayName[day]!)) {
      result.add(day);
    }
  }

  return result;
}

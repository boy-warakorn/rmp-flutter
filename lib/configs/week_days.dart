import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/widgets/interactions/week_day_checkbox.dart';

Map<WeekDay, Color> dayColor = {
  WeekDay.sunday: kSunday,
  WeekDay.monday: kMonday,
  WeekDay.tuesday: kTuesday,
  WeekDay.wednesday: kWednesday,
  WeekDay.thursday: kThursday,
  WeekDay.friday: kFriday,
  WeekDay.saturday: kSaturday,
};

Map<WeekDay, String> dayName = {
  WeekDay.sunday: "Sunday",
  WeekDay.monday: "Monday",
  WeekDay.tuesday: "Tuesday",
  WeekDay.wednesday: "Wednesday",
  WeekDay.thursday: "Thursday",
  WeekDay.friday: "Friday",
  WeekDay.saturday: "Saturday",
};
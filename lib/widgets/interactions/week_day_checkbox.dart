import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/colors.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/general/custom_text.dart';

enum WeekDay {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

Map<WeekDay, Color> _dayColor = {
  WeekDay.sunday: kSunday,
  WeekDay.monday: kMonday,
  WeekDay.tuesday: kTuesday,
  WeekDay.wednesday: kWednesday,
  WeekDay.thursday: kThursday,
  WeekDay.friday: kFriday,
  WeekDay.saturday: kSaturday,
};

Map<WeekDay, String> _dayName = {
  WeekDay.sunday: "Sunday",
  WeekDay.monday: "Monday",
  WeekDay.tuesday: "Tuesday",
  WeekDay.wednesday: "Wednesday",
  WeekDay.thursday: "Thursday",
  WeekDay.friday: "Friday",
  WeekDay.saturday: "Saturday",
};

class WeekDayCheckbox extends StatelessWidget {
  final WeekDay day;
  final bool selected;
  final bool showCheckIcon;
  final void Function()? onPress;

  const WeekDayCheckbox({
    Key? key,
    required this.day,
    this.selected = true,
    this.showCheckIcon = true,
    this.onPress,
  }) : super(key: key);

  Widget _buildContent(BuildContext context) {
    List<Widget> rowContent;

    if (selected && showCheckIcon) {
      rowContent = [
        Icon(
          Icons.done,
          color: kLightColor,
        ),
        kSizedBoxHorizontalXS,
        CustomText(
          _dayName[day]!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: kLightColor,
              ),
        ),
        kSizedBoxHorizontalXXS,
      ];
    } else {
      rowContent = [
        CustomText(
          _dayName[day]!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: selected ? kLightColor : _dayColor[day],
              ),
        ),
      ];
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: kSizeM,
        width: kSizeXL,
        decoration: BoxDecoration(
          border: selected
              ? null
              : Border.all(
                  width: kSizeXXXS,
                  color: _dayColor[day]!,
                ),
          color: selected ? _dayColor[day] : Colors.transparent,
          borderRadius: kBorderRadiusM,
        ),
        child: _buildContent(context),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rmp_flutter/configs/constants.dart';
import 'package:rmp_flutter/widgets/interactions/week_day_checkbox.dart';

class WeekDaySelector extends StatelessWidget {
  const WeekDaySelector({
    Key? key,
    required this.selectedDays,
    this.showCheckIcon = true,
    this.onSelect,
  }) : super(key: key);

  final List<WeekDay> selectedDays;
  final bool showCheckIcon;
  final void Function(WeekDay)? onSelect;

  Widget _buildCheckbox(WeekDay day) {
    return WeekDayCheckbox(
      day: day,
      selected: selectedDays.contains(day),
      onPress: onSelect == null ? null : () => onSelect!(day),
      showCheckIcon: showCheckIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCheckbox(WeekDay.sunday),
            _buildCheckbox(WeekDay.monday),
          ],
        ),
        kSizedBoxVerticalS,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCheckbox(WeekDay.tuesday),
            _buildCheckbox(WeekDay.wednesday),
          ],
        ),
        kSizedBoxVerticalS,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCheckbox(WeekDay.thursday),
            _buildCheckbox(WeekDay.friday),
          ],
        ),
        kSizedBoxVerticalS,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCheckbox(WeekDay.saturday),
          ],
        ),
      ],
    );
  }
}

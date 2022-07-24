/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final bool isSelected;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Check if onDateSelected is not null
            if (onDateSelected != null) {
              // Call the onDateSelected Function
              onDateSelected!(this.date);
            }
          },
          child: Container(
            width: width,
            height: width,
            margin: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xff5524E5) : Color(0xffF2F2F2),
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      ),
                    ]
                  : [],
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : Color(0xff5B5B5B).withOpacity(.2),
              ),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text("${date.day}.${date.month}.", // Date
                  style: dateTextStyle),
            ),
          ),
        ),
        SizedBox(
          height: 1,
        ),
        Text(
          new DateFormat("E", locale).format(date).toTitleCase(), // WeekDay
          style: dayTextStyle?.copyWith(color: Colors.black),
        )
      ],
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

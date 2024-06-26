import 'package:flutter/material.dart';

class DateTimePicker{
  static Future selectDate(context,
      {DateTime? firstDate, DateTime? initialDate, DateTime? lastDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: firstDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000, 1),
      lastDate: lastDate ?? DateTime(2030, 1),
    );
    return picked;
  }

}
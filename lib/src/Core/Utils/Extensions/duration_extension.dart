import 'package:flutter/material.dart';

extension DurationExtension on int {
  Duration get toHours => Duration(hours: this);
  Duration get toMinutes => Duration(minutes: this);
  Duration get toSeconds => Duration(seconds: this);
  Duration get toMilliseconds => Duration(milliseconds: this);
  Duration get toMicroseconds => Duration(microseconds: this);
}

extension DateTimeExtension on DateTime? {
  DateTime get noneNull => this ?? DateTime.now();

  TimeOfDay get toTimeOfDay =>
      TimeOfDay(hour: noneNull.hour, minute: noneNull.minute);

  String get toTime => '${noneNull.hour}:${noneNull.minute}';
}

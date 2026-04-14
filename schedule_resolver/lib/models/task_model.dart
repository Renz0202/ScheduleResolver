import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskModel {
  final String id;
  final String title;
  final String category;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int urgency;
  final int importance;
  final double estimatedEffortHours;
  final String energyLevel;

  TaskModel({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.urgency,
    required this.importance,
    required this.estimatedEffortHours,
    required this.energyLevel,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'date': date.toIso8601String().split('T').first,
      'startTime':
          '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}',
      'endTime': '${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}',
      'urgency': urgency,
      'importance': importance,
      'estimatedEffortHours': estimatedEffortHours,
      'energyLevel': energyLevel,
    };
  }

  String get formattedDate => DateFormat('EEE, MMM d').format(date);

  String get formattedStartTime => _formatTimeOfDay(startTime);

  String get formattedEndTime => _formatTimeOfDay(endTime);

  String _formatTimeOfDay(TimeOfDay time) {
    final hours = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minutes = time.minute.toString().padLeft(2, '0');
    final suffix = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hours:$minutes $suffix';
  }
}

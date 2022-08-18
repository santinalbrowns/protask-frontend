import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:protask/models/user.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  const Task({
    required this.id,
    required this.name,
    required this.due,
    required this.completed,
    required this.project,
    required this.user,
  });

  final String id;
  final String name;
  final DateTime due;
  final bool completed;
  final String project;
  final User user;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

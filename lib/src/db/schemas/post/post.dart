import 'dart:convert';

import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 0)
class Post {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String type;
  // types: exercise, info, etc

  @HiveField(3)
  final String description;

  @HiveField(4)
  final ExerciseProps exerciseProps;

  Post({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.exerciseProps
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'type': type,
      'description': description,
      'exerciseProps': {
        'time': exerciseProps.time,
        'calories': exerciseProps.calories
      }
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      type: map['type'],
      exerciseProps: ExerciseProps(time: map['exerciseProps']['time'], calories: map['exerciseProps']['calories'])
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
    Post.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ExerciseProps {
  final String time;
  final String calories;

  ExerciseProps({this.time = '', this.calories = ''});
}
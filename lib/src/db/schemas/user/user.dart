import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String gender;

  @HiveField(4)
  final DateTime birthDate;

  @HiveField(5)
  final double weight;

  @HiveField(6)
  final double height;

  @HiveField(7)
  final int age;

  @HiveField(8)
  final String hashedPassword;

  @HiveField(9)
  final String goal;

  User({
    required this.hashedPassword,
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.birthDate,
    required this.weight,
    required this.height,
    required this.age,
    required this.goal
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'gender': gender,
    'birthDate': birthDate.toIso8601String(),
    'weight': weight,
    'height': height,
    'age': age,
    'hashedPassword': hashedPassword,
    'goal': goal
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    gender: json['gender'],
    birthDate: DateTime.parse(json['birthDate']),
    weight: (json['weight'] as int).toDouble(),
    height: (json['height'] as int).toDouble(),
    age: json['age'],
    hashedPassword: json['password'],
    goal: json['fitness_goal']
  );

  Map<String, Object> toMap() => {
    "name": name,
    "email": email,
    "gender": gender,
    "birthDate": birthDate,
    "weight": weight,
    "height": height,
    "age": age,
    "hashedPassword": hashedPassword
  };

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      goal: map['goal'],
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      birthDate: map['birthDate'] != null ? DateTime.parse(map['birthDate']) : DateTime(2000, 1, 1),
      weight: map['weight'] ?? 0.0,
      height: map['height'] ?? 0.0,
      age: map['age'] ?? 0,
      hashedPassword: map['hashedPassword'] ?? '',
    );
  }

  factory User.empty() => User(
    id: '',
    name: '',
    email: '',
    gender: '',
    birthDate: DateTime(2000, 1, 1),
    weight: 0.0,
    height: 0.0,
    age: 0,
    hashedPassword: '',
    goal: ''
  );

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? gender,
    String? mobileNumber,
    DateTime? birthDate,
    double? weight,
    double? height,
    int? age,
    String? hashedPassword,
    String? goal
  }) {
    return User(
      goal: goal ?? this.goal,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      hashedPassword: hashedPassword ?? this.hashedPassword,
    );
  }

}
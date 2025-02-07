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
  final String mobileNumber;

  @HiveField(5)
  final DateTime birthDate;

  @HiveField(6)
  final double weight;

  @HiveField(7)
  final double height;

  @HiveField(8)
  final int age;

  @HiveField(9)
  final String hashedPassword;

  User({
    required this.hashedPassword,
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.mobileNumber,
    required this.birthDate,
    required this.weight,
    required this.height,
    required this.age,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'gender': gender,
    'mobileNumber': mobileNumber,
    'birthDate': birthDate.toIso8601String(),
    'weight': weight,
    'height': height,
    'age': age,
    'hashedPassword': hashedPassword
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    gender: json['gender'],
    mobileNumber: json['mobileNumber'],
    birthDate: DateTime.parse(json['birthDate']),
    weight: json['weight'],
    height: json['height'],
    age: json['age'],
    hashedPassword: json['hashedPassword']
  );

  Map<String, Object> toMap() => {
    "name": name,
    "email": email,
    "gender": gender,
    "mobileNumber": mobileNumber,
    "birthDate": birthDate,
    "weight": weight,
    "height": height,
    "age": age,
    "hashedPassword": hashedPassword
  };

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
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
    mobileNumber: '',
    birthDate: DateTime(2000, 1, 1),
    weight: 0.0,
    height: 0.0,
    age: 0,
    hashedPassword: '',
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
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      birthDate: birthDate ?? this.birthDate,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      hashedPassword: hashedPassword ?? this.hashedPassword,
    );
  }

}
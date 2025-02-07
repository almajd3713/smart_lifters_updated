import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:smart_lifters/src/db/schemas/user/user.dart';
import 'package:argon2/argon2.dart';


class UserRepository {
  final _client = http.Client();
  final Box<User> _usersBox;
  final argon2 = Argon2BytesGenerator();

  UserRepository({required Box<User> usersBox}) : _usersBox = usersBox;

  Future<User> createNewUser(Map<String, dynamic> map) async {
    final res = await _client.post(
        Uri.parse('http://localhost:9999/users/create'),
        body: {
          "id": map['id'],
          "name": map['name'],
          "email": map['email'],
          "gender": map['gender'],
          "mobileNumber": map['mobileNumber'],
          "birthDate": DateTime.parse(map['birthDate']),
          "weight": map['weight'],
          "height": map['height'],
          "age": map['age'],
        }
    );
    final data = jsonDecode(res.body);
    User user = User.fromJson(data);
    return user;
  }


  Future<User> getUser(String email, String password) async {
    // final res = await _client.post(
    //   Uri.parse('http://localhost:9999/users/auth')
    // );
    return User.empty();
  }

  Future<List<User>> getUsers() async {
    final res = await _client.get(
        Uri.parse('http://localhost:9999/users')
    );
    if (res.statusCode != 200) {
      throw Exception('Something wrong went with fetching users');
    }

    final json = jsonDecode(res.body);
    final users = json.map((e) => User.fromMap(e as Map<String, dynamic>));

    return users.toList();
  }



  Future<void> saveUsersLocal({
    required List<User> users,
  }) async {
    for (final user in users) {
      await _usersBox.put(user.id, user);
    }
  }

  Future<List<User>> getUsersLocal() async {
    final localUsers = _usersBox.values.toList();
    return localUsers;
  }
}

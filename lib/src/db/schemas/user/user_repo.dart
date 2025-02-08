import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:smart_lifters/src/db/schemas/user/user.dart';
import 'package:argon2/argon2.dart';

const base_url = 'http://10.0.2.2:3500';

class UserRepository {
  final _client = http.Client();
  final Box _usersBox;
  final argon2 = Argon2BytesGenerator();

  UserRepository({required Box usersBox}) : _usersBox = usersBox;

  Future<User> createNewUser(User user) async {
    final url = Uri.parse('$base_url/users/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    var responseData = jsonDecode(response.body);
    responseData = jsonDecode(responseData);
    if(responseData.containsKey('error')) {
      throw responseData['message'];
      }
    print(responseData);
    return User.fromJson(responseData);
  }


  Future<User> getUser(String email, String password) async {
    final url = Uri.parse('${base_url}/users/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password
      }),
    );
    var responseData = jsonDecode(response.body);
    responseData = jsonDecode(responseData);
    if(responseData == null || responseData.containsKey('error')) {
      throw responseData['message'];
    }
    print(responseData);
    return User.fromJson(responseData);
  }

  Future<User> getUserById(String userId) async {
    final url = Uri.parse('${base_url}/users/login/id');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId
      }),
    );
    var responseData = jsonDecode(response.body);
    responseData = jsonDecode(responseData);
    if(responseData.containsKey('error')) {
      throw responseData['message'];
    }
    print(responseData);
    return User.fromJson(responseData);
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
    return localUsers as List<User>;
  }
}

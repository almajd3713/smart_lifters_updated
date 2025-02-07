

import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

class UserRepository {
  final Box<User> _userBox;

  UserRepository({required Box<User> userBox}) : _userBox = userBox;

  Future<User?> getCurrentUser() async {
    return _userBox.get('currentUser');
  }

  Future<void> saveUser(User user) async {
    await _userBox.put('currentUser', user);
  }

  Future<void> deleteUser() async {
    await _userBox.delete('currentUser');
  }

  Future<void> updateUserProfile({
    required String name,
    required String email,
  }) async {
    final currentUser = await getCurrentUser();
    if (currentUser != null) {
      final updatedUser = currentUser.copyWith(
        name: name,
        email: email,
      );
      await saveUser(updatedUser);
    }
  }
}

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:smart_lifters/src/db/schemas/post/post.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

class PostRepository {
  final _client = http.Client();
  final Box<Post> _postsBox;

  PostRepository({required Box<Post> postsBox}) : _postsBox = postsBox;

  Future<List<Post>> getPosts() async {
    final res = await _client.get(Uri.parse('http://localhost:9999/posts'));
    if (res.statusCode != 200) {
      throw Exception('SOmething wrong went with fetching users');
    }

    final json = jsonDecode(res.body);
    final users = json.map((e) => User.fromMap(e as Map<String, dynamic>));

    return users.toList();
  }

  Future<void> savePostsLocal({
    required List<Post> posts,
  }) async {
    for (final post in posts) {
      await _postsBox.put(post.id, post);
    }
  }

  Future<List<Post>> getPostsLocal() async {
    final localUsers = _postsBox.values.toList();
    return localUsers;
  }
}

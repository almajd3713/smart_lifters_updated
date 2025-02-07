

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_lifters/src/db/schemas/post/post.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';
import 'package:path_provider/path_provider.dart';

late Box localPosts;
late Box localData;

Future<void> initPrefs() async {

  final directory = await getApplicationDocumentsDirectory();
  final customPath = '${directory.path}/hive_boxes';

  await Hive.initFlutter(customPath);
  await openBoxes();
}

Future<void> openBoxes() async {
  Hive.registerAdapter(PostAdapter());
  Hive.registerAdapter(UserAdapter());
  localPosts = await Hive.openBox<Post>('POST_DB');
  localData = await Hive.openBox('BOOL_DB');

  await checkFirstLaunch();
}

Future<void> checkFirstLaunch() async {
  // bool? isFirstLaunch = localData.get('is_first_launch');
  // if(isFirstLaunch == null || isFirstLaunch) {
    // await localData.put('is_first_launch', false);
    // await localData.put('user', User());
  // }
}
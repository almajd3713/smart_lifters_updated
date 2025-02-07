import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:smart_lifters/src/db/prefs.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

class Launch extends StatefulWidget {

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      checkFirstLaunch();
    });
  }

  void checkFirstLaunch() {
    bool? isFirstLaunch = localData.get('is_first_launch');
    String? current_user = localData.get('current_user_id');

    if(isFirstLaunch == null || isFirstLaunch) {
      Navigator.of(context, rootNavigator: true).pushReplacementNamed('/onboarding');
    } else if(current_user != null) {
      Navigator.of(context, rootNavigator: true).pushReplacementNamed('/home');
    } else {
      Navigator.of(context, rootNavigator: true).pushReplacementNamed('/onboarding/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/favicon_black.png', width: 100,),
            const SizedBox(height: 20),
            const Text(
              'SMART LIFTERS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

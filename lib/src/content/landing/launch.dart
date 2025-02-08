import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
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
    String? current_user_id = localData.get('current_user_id');

    if(isFirstLaunch == null || isFirstLaunch) {
      Navigator.of(context, rootNavigator: true).pushReplacementNamed('/onboarding');
    } else if(current_user_id != null) {
      BlocProvider.of<UserBloc>(context).add(LoginEventById(current_user_id));
    } else {
      Navigator.of(context, rootNavigator: true).pushReplacementNamed('/onboarding/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if(state is UserAuthenticated) {
              Navigator.of(context, rootNavigator: true).pushReplacementNamed('/home');
            }
          },
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
      ),
    );
  }
}

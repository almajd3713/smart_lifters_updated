

import 'package:flutter/material.dart';
import 'package:smart_lifters/src/content/home_controller.dart';
import 'package:smart_lifters/src/content/landing/age.dart';
import 'package:smart_lifters/src/content/landing/gender.dart';
import 'package:smart_lifters/src/content/landing/goal.dart';
import 'package:smart_lifters/src/content/landing/height.dart';
import 'package:smart_lifters/src/content/landing/launch.dart';
import 'package:smart_lifters/src/content/landing/login.dart';
import 'package:smart_lifters/src/content/landing/on_boarding.dart';
import 'package:smart_lifters/src/content/landing/physical_level.dart';
import 'package:smart_lifters/src/content/landing/sign_up.dart';
import 'package:smart_lifters/src/content/landing/weight.dart';

// Map<String, WidgetBuilder> routes = {
//   '/home'
// };

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/launch':
        return MaterialPageRoute(builder: (context) => Launch(),);
      case '/onboarding':
        return MaterialPageRoute(builder: (context) => OnBoarding(),);
      case '/onboarding/home':
        return MaterialPageRoute(builder: (context) => Login(),);
      case '/onboarding/login':
        return MaterialPageRoute(builder: (context) => Login(),);
      case '/onboarding/sign_up':
        return MaterialPageRoute(builder: (context) => SignUp(),);
      case '/onboarding/gender':
        return MaterialPageRoute(builder: (context) => Gender(),);
      case '/onboarding/age':
        return MaterialPageRoute(builder: (context) => Age(),);
      case '/onboarding/weight':
        return MaterialPageRoute(builder: (context) => Weight(),);
      case '/onboarding/height':
        return MaterialPageRoute(builder: (context) => Height(),);
      case '/onboarding/goal':
        return MaterialPageRoute(builder: (context) => Goal(),);
      case '/onboarding/physical_level':
        return MaterialPageRoute(builder: (context) => PhysicalLevel(),);
      case '/home':
        return MaterialPageRoute(builder: (context) => const ContentController(),);
      // case '/boarding':
        // return MaterialPageRoute(builder: (context) => const ,)
      default:
        return MaterialPageRoute(builder: (context) => const Center(child: Text("404 Not Found"),),);
    }
  }

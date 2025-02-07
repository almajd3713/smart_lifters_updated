

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/app/router/router.dart';
import 'package:smart_lifters/src/app/theme/theme.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => UserBloc(),)
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: '/launch',
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
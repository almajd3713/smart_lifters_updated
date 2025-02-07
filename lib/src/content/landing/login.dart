import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:smart_lifters/src/db/prefs.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Log In',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if(state is UserAuthenticated) {
              Navigator.pushNamed(context, '/home');
            }
            else if(state is UserUnauthenticated) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Incorrect information. Check your info and try again.'),
                ));
            }
          },
          builder: (context, state) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Username or Email',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _usernameController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Username or Email',
                            hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,

                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,

                          style:
                              TextStyle(color: Colors.white), // Text input style
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Password',

                            labelStyle: TextStyle(
                              color: Colors.white, // Label text color
                            ),
                            filled: true,
                            fillColor: Colors.black, // Background color
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    context.read<UserBloc>().add(LoginEvent(_usernameController.text, _passwordController.text));
                    // String name = _usernameController.text;
                    // String password = _passwordController.text;
                    // bool isUsernameMatch = name == user.name;
                    // bool isEmailMatch = name == user.email;
                    // bool isPasswordMatched = password == user.password;
                    // bool allFilled = name.isNotEmpty && password.isNotEmpty;
                    //
                    // if (!allFilled) {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text('You have not filled all the fields!'),
                    //   ));
                    // } else if((isEmailMatch || isUsernameMatch) && isPasswordMatched) {
                    //   localData.put('user', user);
                    //   Navigator.pushNamed(context, '/home');
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text('Incorrect information. Check your info and try again.'),
                    //   ));
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don\'t have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushReplacementNamed(context, '/onboarding/sign_up');
                        Navigator.pushNamedAndRemoveUntil(context, '/onboarding/sign_up', (route) => false,);

                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:smart_lifters/src/db/prefs.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        title: const Text(
          'Create Account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if(state is UserAuthenticated) {
                Navigator.pushNamed(context, '/home');
              }
              else if(state is UserError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message)
                  ));
              }
            },
            builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Let\'s Start',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                Container(
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Full name',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _usernameController,
                          style:
                              const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Full name',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),

                            filled: true,
                            fillColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Email address',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _emailController,
                          style:
                              const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Email address',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),

                            filled: true,
                            fillColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style:
                              const TextStyle(color: Colors.white), // Text input style
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

                            labelStyle: const TextStyle(
                              color: Colors.white, // Label text color
                            ),
                            filled: true,
                            fillColor: Colors.black, // Background color
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _passwordConfirmController,
                          obscureText: true,
                          style:
                              const TextStyle(color: Colors.white), // Text input style
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Confirm Password',

                            labelStyle: const TextStyle(
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
                            child: const Text('Forgot Password?',style:
                              TextStyle(color: Colors.black),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    String name = _usernameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String passwordConfirm = _passwordConfirmController.text;
                    context.read<UserBloc>().add(SignupEvent(name, email, password));
                    // bool allFilled = name.isNotEmpty && email.isNotEmpty && password.isNotEmpty && passwordConfirm.isNotEmpty;
                    // bool passwordMatch = password == passwordConfirm;
                    //
                    // if(!allFilled) {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text('You have not filled all the fields!'),
                    //   ));
                    // } else if(!passwordMatch) {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text('Passwords do not match!')
                    //   ));
                    // } else {
                    //   User user = await localData.get('user_signup');
                    //   user.name = name;
                    //   user.email = email;
                    //   user.password = password;
                    //   localData.put('user', user);
                    //   localData.put('user_default', user);
                    //   Navigator.pushNamed(context, '/home');
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
                    'Sign up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 10
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",style:
                                  TextStyle(color: Colors.black),),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/onboarding/login', (route) => false,);
                      },
                      child:  const Text('Login',style:
                                  TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                    ),
                )],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:smart_lifters/src/db/prefs.dart';

class PhysicalLevel extends StatelessWidget {
  const PhysicalLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 10),
                // Title
                const Text(
                  "Physical Activity Level",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Description
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 40),
                // Buttons
                Expanded(
                  child: Column(
                    children: [
                      _buildButton("Beginner", Colors.yellow, Colors.black, context, state),
                      const SizedBox(height: 20),
                      _buildButton("Intermediate", Colors.yellow, Colors.black, context, state),
                      const SizedBox(height: 20),
                      _buildButton("Advance", Colors.yellow, Colors.black, context, state),
                    ],
                  ),
                ),
                // Continue Button
                ElevatedButton(
                  onPressed: () async {
                    // Use _selectedLevel to pass the selected activity level to the next screen
                    if (state.props['physical_level'] != null) {
                      // Navigate to next screen
                      localData.put('is_first_launch', false);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/onboarding/login', // Replace Goal() with the new page you want
                        (route) =>
                            false, // This condition ensures all the previous routes are removed
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Center(
                      child: Text(
                        "Finish",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color backgroundColor, Color textColor, BuildContext context, UserState state) {
    return ElevatedButton(
      onPressed: () {
        context.read<UserBloc>().add(UpdateOnboardingDataEvent('physical_level', text));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: (state.props['physical_level'] as String) == text
            ? Colors.grey
            : backgroundColor, // Highlight selected option
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

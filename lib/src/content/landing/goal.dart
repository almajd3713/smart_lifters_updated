// Screen 2: Goal Screen
import 'package:flutter/material.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Goal extends StatelessWidget {
  const Goal({super.key});

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
                  "What Is Your Goal?",
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
                const SizedBox(height: 20),
                // Goal Options
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10, ),
                      _buildGoalOption("Lose Weight", context, state),
                      const SizedBox(height: 10,),
                      _buildGoalOption("Gain Weight", context, state),
                      const SizedBox(height: 10,),
                      _buildGoalOption("Muscle Mass Gain", context, state),
                      const SizedBox(height: 10,),
                      _buildGoalOption("Shape Body", context, state),
                      const SizedBox(height: 10),
                      _buildGoalOption("Others", context, state),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                // Continue Button
                ElevatedButton(
                  onPressed: () {
                    print(state.props);
                    Navigator.pushNamed(context, '/onboarding/physical_level');
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
                        "Continue",
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

  Widget _buildGoalOption(String goal, BuildContext context, UserState state) {
    return RadioListTile<String>(
      value: goal,
      groupValue: state.props['goal'] as String,
      onChanged: (value) {
        context.read<UserBloc>().add(UpdateOnboardingDataEvent('goal', value));
      },
      title: Text(
        goal,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      activeColor: Colors.yellow,
      tileColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

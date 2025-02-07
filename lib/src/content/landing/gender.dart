import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:smart_lifters/src/db/prefs.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

class Gender extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "What's Your Gender?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GenderButton(
                  icon: Icons.male,
                  label: 'Male',
                  isSelected: state.props['gender'] == 'Male',
                  onTap: () {
                    context.read<UserBloc>().add(const UpdateOnboardingDataEvent("gender", "Male"));
                  },
                ),
                GenderButton(
                  icon: Icons.female,
                  label: 'Female',
                  isSelected: state.props['gender'] == 'Female',
                  onTap: () {
                    context.read<UserBloc>().add(const UpdateOnboardingDataEvent("gender", "Female"));
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: state.props['gender'] != null
                    ? () {
                  print(state.props);
                  Navigator.pushNamed(context, '/onboarding/age');
                        // User user = User();
                        // user.gender = _selectedGender ?? "Male";
                        // localData.put('user_signup', user);
                  } : null, // Disable button if no gender is selected
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: const Text("Continue"),
              ),
          ],
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderButton({super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor:
                isSelected ? Colors.yellow : Colors.grey.shade200,
            child: Icon(
              icon,
              size: 40,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:smart_lifters/src/db/prefs.dart';

class Age extends StatelessWidget {
  const Age({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,

      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "How Old Are You?",
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
            // Text(
            //   '$_selectedAge',
            //   style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 20),
            AgePicker(
              minAge: 18,
              maxAge: 60,
              selectedAge: state.props['age'] as int,
              onChanged: (value) {
                context.read<UserBloc>().add(UpdateOnboardingDataEvent("age",  value + 18));
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  print(state.props);
                  Navigator.pushNamed(context, '/onboarding/weight');
                },
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

class AgePicker extends StatelessWidget {
  final int minAge;
  final int maxAge;
  final int selectedAge;
  final Function(int) onChanged;

  const AgePicker({super.key,
    required this.minAge,
    required this.maxAge,
    required this.selectedAge,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        perspective: 0.003,
        diameterRatio: 2.0,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: onChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            int age = minAge + index;
            return Center(
              child: Text(
                age.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: age == selectedAge ? Colors.black : Colors.grey,
                ),
              ),
            );
          },
          childCount: maxAge - minAge + 1,
        ),
      ),
    );
  }
}

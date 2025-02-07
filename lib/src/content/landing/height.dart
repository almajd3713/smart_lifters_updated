import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:smart_lifters/src/db/prefs.dart';

class Height extends StatelessWidget {
  const Height({super.key});


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
              "What Is Your Height?",
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
            Text(
              "${(state.props['height'] as double).toInt()} cm",
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            HeightPicker(
              minHeight: 140,
              maxHeight: 220,
              selectedHeight: state.props['height'] as double,
              onChanged: (value) {
                context.read<UserBloc>().add(UpdateOnboardingDataEvent('height', value));
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                print(state.props);
                Navigator.pushNamed(context, '/onboarding/goal'); // Adjust route as needed
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),

              ),
              child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
            ),

          ],
        ),
      ),
    );
  }
}

class HeightPicker extends StatelessWidget {
  final double minHeight;
  final double maxHeight;
  final double selectedHeight;
  final Function(double) onChanged;

  const HeightPicker({super.key,
    required this.minHeight,
    required this.maxHeight,
    required this.selectedHeight,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        perspective: 0.003,
        diameterRatio: 2.0,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          onChanged(minHeight + index);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            double height = minHeight + index;
            return Center(
              child: Text(
                "${height.toInt()} cm",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: height == selectedHeight ? Colors.black : Colors.grey,
                ),
              ),
            );
          },
          childCount: (maxHeight - minHeight).toInt() + 1,
        ),
      ),
    );
  }
}

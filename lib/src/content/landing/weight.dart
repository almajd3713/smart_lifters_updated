import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:smart_lifters/src/db/prefs.dart';

class Weight extends StatelessWidget {
  const Weight({super.key});

  double toLB(double val) {
    return (val * 2.204).roundToDouble();
  }

  double toKG(double val) {
    return (val / 2.204).roundToDouble();
  }

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
              "What Is Your Weight?",
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
            ToggleButtons(
              isSelected: [state.props['isKG'] as bool, !(state.props['isKG'] as bool)],
              borderRadius: BorderRadius.circular(20),
              selectedColor: Colors.white,
              fillColor: Colors.black,
              onPressed: (index) {
                int isKg = (state.props['isKG'] as bool) ? 1 : 0;
                if(isKg == index) {
                  context.read<UserBloc>().add(UpdateOnboardingDataEvent("isKG", index == 0 ));
                  context.read<UserBloc>().add(UpdateOnboardingDataEvent("weight",
                      index == 0 ? toKG(state.props['weight'] as double) : toLB(state.props['weight'] as double)
                  ));
                }
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('KG', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('LB', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "${(state.props['weight'] as double).toInt()} ${(state.props['isKG'] as bool) ? 'Kg' : 'Lb'}",
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            WeightPicker(
              minWeight: (state.props['isKG'] as bool) ? 40 : 88, // KG or LB ranges
              maxWeight: (state.props['isKG'] as bool) ? 120 : 265,
              selectedWeight: state.props['weight'] as double,
              onChanged: (value) {
                context.read<UserBloc>().add(UpdateOnboardingDataEvent("weight", value));
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                print(state.props);
                Navigator.pushNamed(context, '/onboarding/height'); // Adjust route as needed
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

class WeightPicker extends StatelessWidget {
  final double minWeight;
  final double maxWeight;
  final double selectedWeight;
  final Function(double) onChanged;

  const WeightPicker({super.key,
    required this.minWeight,
    required this.maxWeight,
    required this.selectedWeight,
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
          onChanged(minWeight + index);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            double weight = minWeight + index;
            return Center(
              child: Text(
                weight.toInt().toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: weight == selectedWeight ? Colors.black : Colors.grey,
                ),
              ),
            );
          },
          childCount: (maxWeight - minWeight).toInt() + 1,
        ),
      ),
    );
  }
}

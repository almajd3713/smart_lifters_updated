import 'package:flutter/material.dart';
import 'package:smart_lifters/src/core/constants/numbers.dart';

class CompactExercise extends StatelessWidget {
  const CompactExercise({
    super.key,
    required this.srcWidth,
  });

  final double srcWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card.outlined(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(width: 1, color: Colors.black)),
        child: Column(
          children: [
            SizedBox(
                width: srcWidth / 2 - Constants.padding * 1.5,
                child: Image.asset('assets/images/workout_test.png',
                    fit: BoxFit.fill)),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Squat Exercise"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.timelapse,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 10,
                              ),
                              const Text('12 Minutes', style: TextStyle(fontSize: 10))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 10,
                              ),
                              const Text('120Kcal', style: TextStyle(fontSize: 10))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

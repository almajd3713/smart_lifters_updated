import 'package:flutter/material.dart';
import 'package:smart_lifters/src/core/constants/numbers.dart';

class CardExerciseBorderless extends StatelessWidget {
  const CardExerciseBorderless({
    super.key,
    required this.srcWidth,
  });

  final double srcWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            SizedBox(
                width: srcWidth / 2 - Constants.padding * 2,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset('assets/images/workout_test.png',
                        fit: BoxFit.fill))),
            const SizedBox(
              height: 5,
            ),
            Text('Supplements Guide')
          ],
        ),
      ),
    );
  }
}

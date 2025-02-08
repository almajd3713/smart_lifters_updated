



import 'package:flutter/material.dart';
import 'package:smart_lifters/src/core/constants/numbers.dart';
import 'package:smart_lifters/src/core/widgets/exercise.dart';

class WorkoutPlan extends StatelessWidget {
  const WorkoutPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              topPart(context),
              bannerPart(context),
              Padding(
                padding: EdgeInsets.all(Constants.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Round 1", style: Theme.of(context).textTheme.headlineSmall,),
                      ],
                    ),

                    Exercise(),
                    Exercise(),
                    Exercise(),
                    Exercise(),
                    Exercise(),
                    // CardInfoRow(),
                    // CardInfoRow(isDark: true, type: "info",),
                    // CardInfoRow(),
                  ],),
              )
            ],),
        ),
      ),
    );;
  }

  Container bannerPart(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Stack(
            children: [
              Image.asset('assets/images/workout_test.png', fit: BoxFit.fitWidth,),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10) ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello there", style: Theme.of(context).textTheme.headlineSmall,),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                Text(
                                  '45 Minutes',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.local_fire_department,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                Text(
                                  '45 Minutes',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                Text(
                                  '45 Minutes',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding topPart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Constants.padding,
          left: Constants.padding,
          right: Constants.padding,
          bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, icon: const Icon(Icons.arrow_left_outlined)),
                      Stack(
                        children: [
                          Text("Workout".toUpperCase(),
                              style:
                              Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.black,
                              )),
                          Text("Workout".toUpperCase(),
                              style:
                              Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

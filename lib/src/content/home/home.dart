

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/content/home_controller.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:smart_lifters/src/core/constants/numbers.dart';
import 'package:smart_lifters/src/core/widgets/card_exercise_borderless.dart';
import 'package:smart_lifters/src/core/widgets/card_exercise_compact.dart';
import 'package:smart_lifters/src/core/widgets/card_info_row.dart';
import 'package:smart_lifters/src/db/prefs.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    var srcWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Builder(
        builder: (context) {
          final userState = context.watch<UserBloc>().state as UserAuthenticated ;
          return Column(children: [
            topPart(context, userState),
            topMenuWorkout(context),
            recommendations(context, srcWidth),
            weeklyChallenge(context),
            bottomPart(srcWidth)

          ],);
        }),
    );
  }

  Column bottomPart(double srcWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Articles and Tips"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardExerciseBorderless(srcWidth: srcWidth),
              CardExerciseBorderless(srcWidth: srcWidth),
          ],
        )
      ],
    );
  }

  Padding weeklyChallenge(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Constants.padding / 2, bottom: Constants.padding / 2),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CardInfoRowCompact()
        ),
      ),
    );
  }

  Padding recommendations(BuildContext context, double srcWidth) {
    return Padding(
      padding: const EdgeInsets.only(left: Constants.padding, right: Constants.padding / 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recommendations', style: Theme.of(context).textTheme.headlineSmall),
              Row(children: [
                TextButton.icon(
                  onPressed: () {}, 
                  label: Text('See All', style: Theme.of(context).textTheme.bodyLarge), 
                  icon: const Icon(Icons.arrow_right, color: Colors.black,),
                  iconAlignment: IconAlignment.end,
                ),
              ],)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CompactExercise(srcWidth: srcWidth),
              CompactExercise(srcWidth: srcWidth),
            ],
          )
        ],
      ),
    );
  }

  IntrinsicHeight topMenuWorkout(BuildContext context) {
    return IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(onPressed: () {}, icon: Image.asset('assets/icons/dumbell.png', scale: 2.5,)),
                Text("Workout", style: Theme.of(context).textTheme.bodyLarge,)
              ],
            ), 
            VerticalDivider(indent: 10, endIndent: 10, color: Theme.of(context).colorScheme.onSurface),
            Column(
              children: [
                IconButton(onPressed: () {}, icon: Image.asset('assets/icons/apple_check.png', scale: 2.5,)),
                Text("Nutrition", style: Theme.of(context).textTheme.bodyLarge,)
              ],
            ), 
        
          ],
        ),
      );
  }
  

  Widget topPart(BuildContext context, UserAuthenticated state) {
    return Padding(
        padding: const EdgeInsets.only(top: Constants.padding, left: Constants.padding, right: Constants.padding, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                    Text("Hi, ${state.user.name}".toUpperCase(), style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.black,
                  )),
                  Text("Hi, ${state.user.name}".toUpperCase(), style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  )),
                ],),
                Text("It's time to go beyond your limits", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600
                ),)
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {}, icon: Image.asset('assets/icons/search.png', scale: 1.6)),
                IconButton(onPressed: () {}, icon: Image.asset('assets/icons/ring.png', scale: 1.6)),
                IconButton(onPressed: () {
                  ContentController.pageController.animateToPage(3, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                }, icon: Image.asset('assets/icons/account.png', scale: 1.6)),
              ],
            )
          ],),
      );
  }
}



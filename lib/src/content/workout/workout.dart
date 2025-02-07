import 'package:flutter/material.dart';
import 'package:smart_lifters/src/content/home_controller.dart';
import 'package:smart_lifters/src/core/constants/numbers.dart';
import 'package:smart_lifters/src/core/widgets/card_info_row.dart';

class ScreenWorkout extends StatefulWidget {
  const ScreenWorkout({super.key});

  @override
  State<ScreenWorkout> createState() => _ScreenWorkoutState();
}

class _ScreenWorkoutState extends State<ScreenWorkout> {
  final PageController _pageController = PageController(initialPage: 0);
  
  @override
  Widget build(BuildContext context) {
    var srcWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        topPart(context),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (i) => setState(() {
              _selectedIndex = i;
            }),
            children: [
              workoutPage(context, "Beginner"),
              workoutPage(context, "Intermediate"),
              workoutPage(context, "Advanced"),
            ],
          ),
        )
      ],
    );
  }

  SingleChildScrollView workoutPage(BuildContext context, String type) {
    return SingleChildScrollView(
      child: Column(
        children: [
        bannerPart(context),
        Padding(
          padding: const EdgeInsets.all(Constants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Let's go $type", style: Theme.of(context).textTheme.headlineSmall,),
            Text("Explore Different Workout Styles", style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(height: 10,),
            CardInfoRow(),
            CardInfoRow(isDark: true, type: "info",),
            CardInfoRow(),
          ],),
        )
      ],),
    );
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/search.png', scale: 1.6)),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/ring.png', scale: 1.6)),
                  IconButton(
                      onPressed: () {
                            ContentController.pageController.animateToPage(3,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      },
                      icon: Image.asset('assets/icons/account.png', scale: 1.6)),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              menuButton(context, 0, "Beginner"),
              menuButton(context, 1, "Intermediate"),
              menuButton(context, 2, "Advanced"),
            ],
          )
        ],
      ),
    );
  }

  int _selectedIndex = 0;
  FilledButton menuButton(BuildContext context, int i, String word) 
  => FilledButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.primaryContainer),
    ),
    onPressed: () {
      setState(() => _selectedIndex = i);
      _pageController.animateToPage(i, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }, child: Text(word, style: Theme.of(context).textTheme.bodySmall!.copyWith(
    color: _selectedIndex == i ? Theme.of(context).primaryColor : Colors.white
  ),));
}

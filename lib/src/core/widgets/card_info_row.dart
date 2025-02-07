
import 'package:flutter/material.dart';

class CardInfoRowCompact extends StatelessWidget {
  const CardInfoRowCompact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Card.outlined(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Weekly\nChallenge", 
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w600
                ),),
                Text('Plank with Hip Twist',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w300
                ),
                )
              ],
            ),
          ),
          Expanded(child: Image.asset('assets/images/workout_test.png'))
        ],
      ),
      ),
    );
  }
}

class CardInfoRow extends StatelessWidget {
  const CardInfoRow({
    super.key,
    this.isDark = false,
    this.type = "exercise"
  });
  final bool isDark;
  final String type;
  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: () {
        
      },
       child: Card(
        elevation: 0,
        margin: EdgeInsets.only(top: 10, bottom: 10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: isDark ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.secondaryContainer,
        child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Upper Body",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: isDark ? Theme.of(context).colorScheme.onPrimaryContainer : Theme.of(context).colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5,),
                if(type == "info") Text('Plank with Hip Twist',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isDark ? Theme.of(context).colorScheme.onPrimaryContainer : Theme.of(context).colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w300
                ),)
                else if(type == "exercise")                Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.timelapse,
                                color: Colors.white,
                                size: 10,
                              ),
                              Text(
                                '60 Minutes',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: isDark
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer,
                                    ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.local_fire_department,
                                color: Colors.white,
                                size: 10,
                              ),
                              Text(
                                '1320 Kcal',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: isDark
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer,
                                    ),
                              )
                            ],
                          ),
                        ],
                      )
              ],
            ),
          ),
          Expanded(child: Image.asset('assets/images/workout_test.png'))
        ],
           )
           ),
     );
  }
}

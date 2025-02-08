import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  const Exercise({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.black
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Dumbell Rows', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                    Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer,
                  )),
                  Text(
                    '60 Minutes',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                      color:
                      Theme.of(context)
                          .colorScheme
                          .primary,
                    ),
                  )
                ],
              ),
              Text(
                  "Repeatitions: 3",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).primaryColor
                  )
              )
            ],
          ),
        ),
      );
  }}

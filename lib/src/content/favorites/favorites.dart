


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_lifters/src/content/home_controller.dart';
import 'package:smart_lifters/src/core/constants/numbers.dart';
import 'package:smart_lifters/src/core/widgets/card_info_row.dart';

class ScreenFavorites extends StatefulWidget {
  const ScreenFavorites({super.key});

  @override
  State<ScreenFavorites> createState() => _ScreenFavoritesState();
}

class _ScreenFavoritesState extends State<ScreenFavorites> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topPart(context),
        favoriteList()
      ],
    );
  }

  Expanded favoriteList() {
    return Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.only(right: Constants.padding, left: Constants.padding),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CardInfoRow(type: ['exercise', 'info'][Random().nextInt(2)], isDark: index % 2 == 0,);
          },),
      );
  }

   Padding topPart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Constants.padding,
          left: Constants.padding,
          right: Constants.padding,
          bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_left_outlined)),
                  Stack(
                    children: [
                      Text("Favorites".toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.black,
                              )),
                      Text("Favorites".toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.secondary,
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
                  icon:
                      Image.asset('assets/icons/account.png', scale: 1.6)),
            ],
          )
        ],
      ),
    );
  }

}
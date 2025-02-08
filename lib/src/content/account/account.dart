


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lifters/src/core/blocs/user/user_bloc.dart';
import 'package:smart_lifters/src/core/constants/numbers.dart';
import 'package:smart_lifters/src/db/prefs.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  
  @override
  Widget build(BuildContext context) {
    List<List> _optionBtns = [
    ['Profile', 'account_black', () {}],
    ['Favorites', 'star_black', () {}],
    ['Privacy Policy', 'lock_black', () {}],
    ['Settings', 'settings_black', () {}],
    ['Help', 'support_black', () {}],
    ['Logout', 'logout_black', () {
      showModalBottomSheet(
        context: context, builder: (context) {
        return SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(Constants.padding / 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Are you sure you want to Logout?", textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                FilledButton(onPressed: () {
                  context.read<UserBloc>().add(LogoutEvent());
                  Navigator.of(context).pushReplacementNamed('/onboarding/login');
              }, child: const Text("Yes")),
                FilledButton(onPressed: () async {
                  Navigator.pop(context);}, child: const Text("No"))
              ],)
            ],),
          ),
        );
      },);
    }],
    ];
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Builder(
        builder: (context) {
          final userState = context.watch<UserBloc>().state;
          return BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if(state is UserUnauthenticated) {
                Navigator.of(context).pushNamedAndRemoveUntil('/onboarding/login', (route) => false);
              }
            },
            builder: (context, state) {
              if(state is UserAuthenticated) {
                return Column(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor
                  ),
                  child: Column(
                    children: [
                      topPart(context, state.user),
                      infoPart(context, state.user),
                    ],
                  ),
                ),
                  bottomPart(context, state.user, _optionBtns)
              ],);
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        }
      ),
      );
        }

  }

  SingleChildScrollView bottomPart(BuildContext context, User user, _optionBtns) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(Constants.padding),
          child: Container(
            transform: Matrix4.translationValues(0, -50, 0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.secondary
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Column(children: [Text("${user.weight} KG", style: const TextStyle(fontWeight: FontWeight.bold)), const Text("Weight")]),
                        const VerticalDivider(color: Colors.white),
                        Flexible(flex: 3, child: Column(children: [Text("${user.age}", style: const TextStyle(fontWeight: FontWeight.bold)), const Text("Years Old")])),
                        const VerticalDivider(color: Colors.white),
                        Column(children: [Text("${user.height} CM", style: const TextStyle(fontWeight: FontWeight.bold)), const Text("Height")]),
                        ],  
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _optionBtns.length,
                  itemBuilder: (context, index) {
                    return optionButton(context, _optionBtns[index][0], _optionBtns[index][1], _optionBtns[index][2]);
                },),
                const SizedBox(height: 200,)
                // optionButton(context, "Profile", "account_black"),
                // optionButton(context, "Favorites", "star_black"),
                // optionButton(context, "Privacy Policy", "lock_black"),
                // optionButton(context, "Settings", "settings_black"),
                // optionButton(context, "Help", "support_black"),
                // optionButton(context, "Logout", "logout_black"),
              ],
            ),
          ),
        ),
    );
  }

  GestureDetector optionButton(BuildContext context, String content, String icon, callback) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Theme.of(context).colorScheme.secondary),
                          child: Image.asset('assets/icons/$icon.png', scale: 2,),
                        ),
                        const SizedBox(width: 20,),
                        Text(content, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20
                        ))
                      ],
                    ),
            IconButton(onPressed: callback, icon: Icon(Icons.arrow_right, color: Theme.of(context).colorScheme.secondary,), )
          ],
        ),
      ),
    );
  }

  Padding infoPart(BuildContext context, User user) {
    return Padding(
            padding: const EdgeInsets.only(
                  right: Constants.padding, left: Constants.padding, bottom: Constants.padding),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset('assets/images/default_pfp.png', alignment: Alignment.center, width: 125, height: 125, fit: BoxFit.cover,)),
                  Text("${user.name}", style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700
                  ),),
                  Text("${user.email}"),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(text: 'Birthday: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'June 16th')
                      ]
                    ),
                  )
              ],
            ),
          );
  }

  Padding topPart(BuildContext context, User user) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_left_outlined)),
                  Text("My Profile",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )),
                ],
              ),
      );
  }

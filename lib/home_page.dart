// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate_navigator/custom_stepper.dart';

import 'package:flutter_animate_navigator/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  bool activated = false;
  bool before = false;
  List<String> listSteps = [
    'ffffffg 1',
    'pagggge 2',
    'paghhe 3',
    'paghhhhhhe 4',
    'paghe 5',
    'page bfbbf6',
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 103, 144, 216),
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Home'),
                CustomStepper(
                  withSize: 600,
                  activated: 4,
                  steps: listSteps,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: const SearchPage(),
                      ),
                    );
                  },
                  child: const Text('Navegar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0), // x,y animated
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

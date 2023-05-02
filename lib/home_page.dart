import 'package:flutter/material.dart';
import 'package:flutter_animate_navigator/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 103, 144, 216),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Home'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, SlideRightRoute(page: const SearchPage())
                        // MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                  },
                  child: const Text('Navegar '),
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

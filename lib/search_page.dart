import 'package:flutter/material.dart';
import 'package:flutter_animate_navigator/home_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) => Scaffold(
          backgroundColor: Colors.yellow,
          appBar: AppBar(
              leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.push(
                context,
                SlideLeftRoute(
                  page: HomePage(),
                ),
              );
            },
          )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text('search'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(page: HomePage()),
                  );
                },
                child: const Text('Navegar '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  SlideLeftRoute({required this.page})
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
              begin: const Offset(-1, 0), // x,y animated
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

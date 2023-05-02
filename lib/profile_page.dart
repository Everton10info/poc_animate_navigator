import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) => const Scaffold(
          backgroundColor: Colors.green,
          body: Center(
            child: Text('profile'),
          ),
        ),
      ),
    );
  }
}

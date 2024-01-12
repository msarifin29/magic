import 'package:flutter/material.dart';

class AppRoute {
  /// [Navigation](https://docs.flutter.dev/ui/navigation)
  ///
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // TODO: implement routing
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'Page not found',
          ),
        ),
      ),
    );
  }
}

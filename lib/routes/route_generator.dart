import 'package:animations/routes/route_names.dart';
import 'package:animations/screens/screens_barrel.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static MaterialPageRoute navigationContainer({Widget page}) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }

  static generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.animatedSwitch:
        return navigationContainer(
          page: AnimatedSwitchScreen(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('No route found'),
            ),
            body: Center(
              child: Text(
                'No route for ${routeSettings.name} found',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
    }
  }
}

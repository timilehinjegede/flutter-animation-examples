import 'package:animations/screens/screens_barrel.dart';
import 'package:flutter/material.dart';

class ScreenModel {
  final String screenRoute;
  final String screenName;
  final Widget screenWidget;

  ScreenModel({this.screenRoute, this.screenName, this.screenWidget});

  static List<ScreenModel> screenModelList = [
    ScreenModel(
      screenName: 'Animated Switch',
      screenRoute: '/animatedSwitchRoute',
      screenWidget: AnimatedSwitchScreen(),
    ),
  ];
}

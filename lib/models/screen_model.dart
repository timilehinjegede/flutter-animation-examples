import 'package:animations/screens/screens_barrel.dart';
import 'package:flutter/material.dart';

class ScreenModel {
  final String screenName;
  final Widget screenWidget;

  ScreenModel({this.screenName, this.screenWidget});

  static List<ScreenModel> screenModelList = [
    // Animated Switch
    ScreenModel(
      screenName: 'Animated Switch',
      screenWidget: AnimatedSwitchScreen(index: 0),
    ),
    // Animated Cards
    ScreenModel(
      screenName: 'Animated Cards',
      screenWidget: AnimatedCards(index: 1),
    ),
  ];
}

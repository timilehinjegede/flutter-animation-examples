import 'package:animations/models/screen_model.dart';
import 'package:flutter/material.dart';

class AnimatedSwitchScreen extends StatelessWidget {
  final int index;

  const AnimatedSwitchScreen({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ScreenModel.screenModelList[index].screenName,
        ),
      ),
    );
  }
}

import 'package:animations/models/screen_model.dart';
import 'package:flutter/material.dart';

class AnimatedSwitchScreen extends StatefulWidget {
  final int index;

  const AnimatedSwitchScreen({Key key, this.index}) : super(key: key);

  @override
  _AnimatedSwitchScreenState createState() => _AnimatedSwitchScreenState();
}

class _AnimatedSwitchScreenState extends State<AnimatedSwitchScreen> {
  // variable to keep the state of the switch
  bool _isOn = false;
  // curve for the animation
  Curve _kAnimationCurve = Curves.easeInOut;
  // duration of the animation
  Duration _kDuration = Duration(
    milliseconds: 300,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ScreenModel.screenModelList[widget.index].screenName,
        ),
      ),
      backgroundColor: _isOn
          ? Color.fromRGBO(244, 254, 247, 1)
          : Color.fromRGBO(255, 243, 244, 1),
      body: Center(
        child: InkResponse(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() => _isOn = !_isOn);
          },
          child: AnimatedContainer(
            duration: _kDuration,
            curve: _kAnimationCurve,
            padding: EdgeInsets.symmetric(
              horizontal: _isOn ? 25 : 10,
            ),
            height: 70,
            width: 140,
            decoration: BoxDecoration(
              color: _isOn
                  ? Color.fromRGBO(65, 235, 121, 1)
                  : Color.fromRGBO(253, 334, 65, 1),
              borderRadius: BorderRadius.circular(
                50,
              ),
            ),
            child: Center(
              // custom switch indicator
              child: AnimatedAlign(
                duration: _kDuration,
                curve: _kAnimationCurve,
                alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: _kDuration,
                  curve: _kAnimationCurve,
                  height: 55,
                  width: _isOn ? 20 : 55,
                  decoration: BoxDecoration(
                    borderRadius: _isOn
                        ? BorderRadius.circular(
                            10,
                          )
                        : BorderRadius.circular(
                            50,
                          ),
                    color: Colors.white,
                  ),
                  // inner circle shown if the switch is turned off
                  child: !_isOn
                      ? Center(
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(253, 334, 65, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

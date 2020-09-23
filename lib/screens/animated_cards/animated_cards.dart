
// card height value
import 'dart:math';

import 'package:flutter/material.dart';

const double kCardHeight = 200;
// card width value
const double kCardWidth = 300;
double kCardWidthHorizontal;
// where the stack of cards should begin [calculated based on the screens width]
double kStartPosition;
// max index of the cards
int kMaxIndex = 3;
// check if the card widths should be reduced
bool reduceCardWidth = false;
// determine when the cards opacity will be toggled
bool toggleOpacity = true;
// determine when the sizes of the mounted cards will be toggled
bool toggleMountedSizes = true;
// curve to be used in animation
const Curve kAnimationCurve = Curves.easeInOut;
// general cards spacing
const double _kCardSpacing = 30;

class AnimatedCards extends StatefulWidget {
  @override
  _AnimatedCardsState createState() => _AnimatedCardsState();
}

class _AnimatedCardsState extends State<AnimatedCards>
    with TickerProviderStateMixin {
  // animation controllers
  AnimationController cardOneController,
      cardTwoController,
      cardThreeController,
      cardFourController;
  // animation objects
  Animation cardOneAnimation,
      cardTwoAnimation,
      cardThreeAnimation,
      cardFourAnimation;
  // tween
  Tween<double> tween = Tween<double>(begin: 0, end: 1);
  // animation status
  var cardOneStatus = AnimationStatus.dismissed,
      cardTwoStatus = AnimationStatus.dismissed,
      cardThreeStatus = AnimationStatus.dismissed,
      cardFourStatus = AnimationStatus.dismissed;

  // variables to determine the state of the cards
  bool _isVerticalView = false;
  bool _isHorizontalView = false;
  bool _isGridView = false;
  bool _isMounted = true;

  // getting the top position[or spacing] of the stacked cards based on the view toggled
  double getTopPositionValues(int index) {
    int _cardPosition = kMaxIndex - index;
    switch (index) {
      case 0:
        return _isVerticalView
            ? ((kCardHeight * _cardPosition) + (_kCardSpacing * _cardPosition))
            : _isHorizontalView
                ? 0
                : _isGridView
                    ? (kCardHeight + _kCardSpacing)
                    : (_kCardSpacing * _cardPosition);
        break;
      case 1:
        return _isVerticalView
            ? ((kCardHeight * _cardPosition) + (_kCardSpacing * _cardPosition))
            : _isHorizontalView
                ? 0
                : _isGridView ? 0 : (_kCardSpacing * _cardPosition);
        break;
      case 2:
        return _isVerticalView
            ? ((kCardHeight * _cardPosition) + (_kCardSpacing * _cardPosition))
            : _isHorizontalView
                ? 0
                : _isGridView
                    ? (kCardHeight + _kCardSpacing)
                    : (_kCardSpacing * _cardPosition);
        break;
      case 3:
        return ((kCardHeight * _cardPosition) +
            (_kCardSpacing * _cardPosition));
        break;
      default:
        return _kCardSpacing;
        break;
    }
  }

  // getting the left position[or spacing] of the stacked cards based on the view toggled
  double getLeftPositionValues(int index) {
    int _cardPosition = kMaxIndex - index;
    switch (index) {
      case 0:
        return _isHorizontalView
            ? kStartPosition / 2 +
                (kCardWidthHorizontal * _cardPosition) +
                (_kCardSpacing * _cardPosition)
            : _isGridView
                ? (kCardWidth / 2) + kStartPosition + _kCardSpacing
                : toggleMountedSizes ? kStartPosition + 40 : kStartPosition;
        break;
      case 1:
        return _isHorizontalView
            ? kStartPosition / 2 +
                (kCardWidthHorizontal * _cardPosition) +
                (_kCardSpacing * _cardPosition)
            : _isGridView
                ? (kCardWidth / 2) + kStartPosition + _kCardSpacing
                : toggleMountedSizes ? kStartPosition + 30 : kStartPosition;
        break;
      case 2:
        return _isHorizontalView
            ? kStartPosition / 2 +
                (kCardWidthHorizontal * _cardPosition) +
                (_kCardSpacing * _cardPosition)
            : _isGridView
                ? kStartPosition / 2
                : toggleMountedSizes ? kStartPosition + 20 : kStartPosition;
        break;
      case 3:
        return _isHorizontalView
            ? kStartPosition / 2
            : _isGridView ? kStartPosition / 2 : kStartPosition;
        break;
      default:
        return kStartPosition;
        break;
    }
  }

  // toggling views
  _toggleVerticalView() {
    setState(() {
      _isVerticalView = !_isVerticalView;
      _resetGridView();
      _resetHorizontalView();
      reduceCardWidth = false;
      _isVerticalView ? _isMounted = false : _isMounted = true;
    });
  }

  _toggleHorizontalView() {
    setState(() {
      _isHorizontalView = true;
      _resetGridView();
      _resetVerticalView();
      reduceCardWidth = true;
      _isMounted = false;
    });
  }

  _toggleGridView() {
    setState(() {
      _isGridView = !_isGridView;
      _resetVerticalView();
      _resetHorizontalView();

      _isGridView ? _isMounted = false : _isMounted = true;
    });
  }

  _collapseHorizontalView() {
    setState(() {
      if (_isHorizontalView) {
        _resetHorizontalView();
        _isMounted = true;
      }
    });
  }

  // resetting views
  _resetVerticalView() {
    setState(() => _isVerticalView = false);
  }

  _resetHorizontalView() {
    setState(() => _isHorizontalView = false);
  }

  _resetGridView() {
    setState(() => _isGridView = false);
  }

  @override
  void initState() {
    // animation controllers instantiation
    // card one animation setup
    cardOneController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    cardOneAnimation = tween.animate(cardOneController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) => cardOneStatus = status);

    // card two animation setup
    cardTwoController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    cardTwoAnimation = tween.animate(cardTwoController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) => cardTwoStatus = status);

    // card three animation setup
    cardThreeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    cardThreeAnimation = tween.animate(cardThreeController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) => cardThreeStatus = status);

    // card four animation setup
    cardFourController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    cardFourAnimation = tween.animate(cardFourController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) => cardFourStatus = status);
    super.initState();
  }

  @override
  void dispose() {
    cardOneController.dispose();
    cardTwoController.dispose();
    cardThreeController.dispose();
    cardFourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // calculating the start position based on the screen's width and card width
    kStartPosition = (MediaQuery.of(context).size.width / 2) - (kCardWidth / 2);
    // assigning the reduceCardWidth variable based on whether the view is horizontal or not
    reduceCardWidth = _isHorizontalView;
    // assigning the toggleOpacity variable based on whether the cards are mounted or not
    toggleOpacity = _isMounted;
    // assigning the toggleMountedSizes variable based on whether the cards are mounted or not
    toggleMountedSizes = _isMounted;
    // calculating the width of the card to be used in the horizontal view
    kCardWidthHorizontal = kCardWidth / 1.6;

    // list of the animation objects
    var animationList = [
      cardOneAnimation,
      cardTwoAnimation,
      cardThreeAnimation,
      cardFourAnimation
    ];
    // list of the animation status
    var statusList = [
      cardOneStatus,
      cardTwoStatus,
      cardThreeStatus,
      cardFourStatus
    ];
    // list of the animation controllers
    var controllerList = [
      cardOneController,
      cardTwoController,
      cardThreeController,
      cardFourController
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Stack(
          children: List.generate(4, (index) {
            return AnimatedPositioned(
              curve: kAnimationCurve,
              top: getTopPositionValues(index),
              left: getLeftPositionValues(index),
              duration: Duration(milliseconds: 500),
              child: CustomCard(
                onDoubleTap: () {
                  _toggleGridView();
                },
                swipeLeft: () {
                  _toggleHorizontalView();
                },
                swipeRight: () {
                  _collapseHorizontalView();
                },
                onTap: () {
                  _toggleVerticalView();
                },
                isFlipped: animationList[index].value >= 0.5,
                currentIndex: index,
                animationList: animationList,
                statusList: statusList,
                controllerList: controllerList,
              ),
            );
          }),
        ),
      ),
    );
  }
}

// flip card widget
class CustomCard extends StatelessWidget {
  final VoidCallback swipeLeft, swipeRight, onTap, onInfoTapped, onDoubleTap;
  final int currentIndex;
  final bool isFlipped;
  final List animationList, statusList, controllerList;

  CustomCard({
    this.swipeLeft,
    this.swipeRight,
    this.currentIndex,
    this.onDoubleTap,
    this.isFlipped,
    this.onTap,
    this.onInfoTapped,
    this.animationList,
    this.statusList,
    this.controllerList,
  });

  @override
  Widget build(BuildContext context) {
    int _maxIndex = 3;

    return GestureDetector(
      // double tap  (expand grid view/ collapse grid view)
      onDoubleTap: onDoubleTap,
      onPanUpdate: (details) {
        // swipe left (expand horizontal view)
        if (details.delta.dx < 0) {
          swipeLeft();
        }
        // swipe right (collapse horizontal view)
        if (details.delta.dx > 0) {
          swipeRight();
        }
      },
      // tap (expand vertical view/ collapse vertical view)
      onTap: onTap,
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(pi * animationList[currentIndex].value),
        child: AnimatedOpacity(
          curve: kAnimationCurve,
          duration: Duration(milliseconds: 500),
          opacity: toggleOpacity
              ? currentIndex == 3
                  ? 1
                  : currentIndex == 2
                      ? 0.3
                      : currentIndex == 1 ? 0.25 : currentIndex == 0 ? 0.15 : 1
              : 1,
          child: AnimatedContainer(
            curve: kAnimationCurve,
            height: kCardHeight,
            width: reduceCardWidth
                ? kCardWidthHorizontal
                : toggleMountedSizes
                    ? CardUtils.mountedSizes[currentIndex]
                    : kCardWidth,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: toggleOpacity
                  ? [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    isFlipped
                        ? CardUtils.endGradientColor[_maxIndex - currentIndex]
                        : CardUtils.startGradientColor[currentIndex],
                    isFlipped
                        ? CardUtils.endGradientColor[_maxIndex - currentIndex]
                        : CardUtils.startGradientColor[currentIndex],
                  ]),
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..rotateY(pi * animationList[currentIndex].value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // title and subtitle
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              isFlipped
                                  ? CardUtils.titleStrings[currentIndex]
                                  : CardUtils.destailStrings[currentIndex],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Certificate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // info button
                      InkWell(
                        onTap: () {
                          if (statusList[currentIndex] ==
                              AnimationStatus.dismissed) {
                            controllerList[currentIndex].forward();
                          } else {
                            controllerList[currentIndex].reverse();
                          }
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35 / 2),
                            color: Colors.white12,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardUtils {
  // start gradient color
  static final List startGradientColor = [
    Colors.blue[300],
    Colors.deepPurpleAccent[700],
    Colors.pink[700],
    Colors.deepOrange[400],
  ];

  // end gradient color
  static final List endGradientColor = [
    Colors.teal[300],
    Colors.indigoAccent[200],
    Colors.purple[600],
    Colors.red[400],
  ];

  // get card mounted sizes
  static final List<double> mountedSizes = [
    kCardWidth - 80,
    kCardWidth - 60,
    kCardWidth - 40,
    kCardWidth,
  ];
  // list of card colors
  static final List<Color> colorValues = [
    Color(0xff4435E0),
    Colors.cyan[700],
    Color(0xffA91C78),
    Color(0xffE54D40),
  ];

// title list
  static final List<String> titleStrings = [
    'Design System in Figma',
    'UI Design for macOS',
    'React for designers',
    'React for developers'
  ];

// description list
  static final List<String> destailStrings = [
    'UI Design for iOS 14',
    'UI Desig for iPadOS',
    'UI Design for macOS',
    'Build a SwiftUI app for iOS 13',
  ];
}

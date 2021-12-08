import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_clock/animated_blur.dart';
import 'package:quiver/time.dart';

/// 24h clock face
///
/// max digit [0-2][0-9]:[0-5][0-9]:[0-5][0-9]
class JustClockFace extends StatefulWidget {
  const JustClockFace({Key? key}) : super(key: key);

  @override
  _JustClockFaceState createState() => _JustClockFaceState();
}

class _JustClockFaceState extends State<JustClockFace> {
  late Timer _timer;
  late List<int> time;

  List<int> get _genTime {
    var now = DateTime.now();
    return [
      now.hour ~/ 10,
      now.hour % 10,
      now.minute ~/ 10,
      now.minute % 10,
      now.second ~/ 10,
      now.second % 10,
    ];
  }

  @override
  void initState() {
    super.initState();
    time = _genTime;
    _timer = Timer.periodic(aSecond, (timer) {
      time = _genTime;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ClockSingleItemWidget(
              weight: FontWeight.bold,
              value: _genTime[0],
              maxDigit: 3,
            ),
            _ClockSingleItemWidget(
              weight: FontWeight.bold,
              value: _genTime[1],
              maxDigit: 10,
            ),
            _ClockSingleItemWidget(
              weight: FontWeight.normal,
              value: _genTime[2],
              maxDigit: 6,
            ),
            _ClockSingleItemWidget(
              weight: FontWeight.normal,
              value: _genTime[3],
              maxDigit: 10,
            ),
            _ClockSingleItemWidget(
              weight: FontWeight.w200,
              value: _genTime[4],
              maxDigit: 6,
            ),
            _ClockSingleItemWidget(
              weight: FontWeight.w200,
              value: _genTime[5],
              maxDigit: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class _ClockSingleItemWidget extends StatefulWidget {
  final int value;
  final int maxDigit;
  final FontWeight weight;
  const _ClockSingleItemWidget({
    Key? key,
    required this.value,
    required this.maxDigit,
    required this.weight,
  }) : super(key: key);

  @override
  __ClockSingleItemWidgetState createState() => __ClockSingleItemWidgetState();
}

class __ClockSingleItemWidgetState extends State<_ClockSingleItemWidget> {
  late FixedExtentScrollController _scrollController;
  bool _animating = false;
  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: widget.value);
  }

  @override
  void didUpdateWidget(covariant _ClockSingleItemWidget oldWidget) {
    if (widget.value != oldWidget.value) {
      _animating = true;
      setState(() {});
      if (widget.value > oldWidget.value) {
        _scrollController
            .animateToItem(
              _scrollController.selectedItem ~/
                      widget.maxDigit *
                      widget.maxDigit +
                  widget.value,
              duration: aMillisecond * 500,
              curve: Curves.easeInOutCubic,
            )
            .then(
              (value) => setState(() {
                _animating = false;
              }),
            );
      } else {
        _scrollController
            .animateToItem(
              _scrollController.selectedItem ~/
                      widget.maxDigit *
                      widget.maxDigit +
                  widget.maxDigit +
                  widget.value,
              duration: aMillisecond * 500,
              curve: Curves.easeInOutCubic,
            )
            .then(
              (value) => setState(() {
                _animating = false;
              }),
            );
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      clipBehavior: Clip.hardEdge,
      width: 112,
      height: 200,
      child: AnimatedBlur(
        sigmaY: _animating ? 6 : 0,
        child: ListWheelScrollView.useDelegate(
          itemExtent: 200,
          controller: _scrollController,
          childDelegate: ListWheelChildLoopingListDelegate(
            children: List.generate(
              widget.maxDigit,
              (index) => Center(
                child: Text(
                  '$index',
                  style: TextStyle(
                    fontSize: 184,
                    fontWeight: widget.weight,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiver/time.dart';

class AnimatedBlur extends ImplicitlyAnimatedWidget {
  final double sigmaX;
  final double sigmaY;
  final Widget child;
  const AnimatedBlur({
    Key? key,
    this.sigmaX = 0,
    this.sigmaY = 0,
    required this.child,
  }) : super(key: key, duration: aMillisecond * 200);

  @override
  _AnimatedBlurState createState() => _AnimatedBlurState();
}

class _AnimatedBlurState extends AnimatedWidgetBaseState<AnimatedBlur> {
  Tween<double>? _xTween;
  Tween<double>? _yTween;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: _xTween?.evaluate(animation) ?? 0,
        sigmaY: _yTween?.evaluate(animation) ?? 0,
      ),
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _xTween = visitor(
      _xTween,
      widget.sigmaX,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;
    _yTween = visitor(
      _yTween,
      widget.sigmaY,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;
  }
}

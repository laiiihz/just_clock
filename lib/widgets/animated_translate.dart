import 'package:flutter/material.dart';

class AnimatedTranslate extends ImplicitlyAnimatedWidget {
  final Widget child;
  final Offset offset;
  const AnimatedTranslate({
    Key? key,
    this.offset = Offset.zero,
    Duration duration = const Duration(milliseconds: 600),
    required this.child,
  }) : super(key: key, duration: duration, curve: Curves.easeInOutCubic);

  @override
  _AnimatedTranslateState createState() => _AnimatedTranslateState();
}

class _AnimatedTranslateState
    extends AnimatedWidgetBaseState<AnimatedTranslate> {
  Tween<Offset>? _offsetTween;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _offsetTween?.evaluate(animation) ?? Offset.zero,
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _offsetTween = visitor(_offsetTween, widget.offset,
        (dynamic value) => Tween<Offset>(begin: value)) as Tween<Offset>?;
  }
}

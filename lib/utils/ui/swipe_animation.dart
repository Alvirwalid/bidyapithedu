
import 'package:flutter/material.dart';

class SwipeAnimation extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;
  final double offsetDx;
  final VoidCallback ?onRightSwipe;
  final VoidCallback ?onLeftSwipe;

  const SwipeAnimation({super.key,
    required this.child,
     this.onRightSwipe,
    this.onLeftSwipe,
    this.animationDuration = const Duration(milliseconds: 300),
    this.offsetDx = 1.3,
  });

  @override
  SwipeAnimationState createState() => SwipeAnimationState();
}

class SwipeAnimationState extends State<SwipeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(curve: Curves.decelerate, parent: _controller),
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _runAnimation({bool? onRight}) {
    //set child animation
    _animation = Tween(
      begin: const Offset(0.0, 0.0),
      end: Offset(onRight == true ? widget.offsetDx : -widget.offsetDx, 0.0),
    ).animate(
      CurvedAnimation(curve: Curves.decelerate, parent: _controller),
    );
    //Forward animation
    _controller.forward().whenComplete(() {
      if (onRight == true) {
        _controller.drive(Tween(begin: 0.0, end: 0.0));
        widget.onRightSwipe!();
      } else {
        _controller.drive(Tween(begin: 0.0, end: 0.0));
        widget.onLeftSwipe!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (widget.onRightSwipe != null && details.delta.dx > 1) {
          _runAnimation(onRight: true);
        }
        if (widget.onLeftSwipe != null && details.delta.dx < -1) {
          _runAnimation(onRight: false);
        }
      },
      child: SlideTransition(
        position: _animation,
        child: widget.child,
      ),
    );
  }
}

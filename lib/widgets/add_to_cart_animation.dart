import 'package:flutter/material.dart';

class AddToCartAnimation extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const AddToCartAnimation({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.elasticIn,
          reverseCurve: Curves.easeOut,
        ),
      ),
      child: child,
    );
  }
} 
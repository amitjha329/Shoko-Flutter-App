import 'package:flutter/material.dart';

class ScaledTransitionRoute extends PageRouteBuilder {
  final Widget pageRoute;
  ScaledTransitionRoute(this.pageRoute)
      : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: animation, curve: Curves.easeInOut)),
                child: child);
          },
          pageBuilder: (context, animation, secondaryAnimation) => pageRoute,
        );
}

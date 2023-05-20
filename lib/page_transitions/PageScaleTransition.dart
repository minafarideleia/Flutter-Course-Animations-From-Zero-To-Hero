import 'package:flutter/material.dart';

class PageScaleTransition extends PageRouteBuilder {
  final dynamic page;

  PageScaleTransition(this.page)
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var _animation = Tween<double>(begin: 0, end: 0.8).animate(
                  CurvedAnimation(
                      parent: animation, curve: Curves.bounceInOut));

              return ScaleTransition(
                scale: _animation,
                child: child,
              );
            });
}

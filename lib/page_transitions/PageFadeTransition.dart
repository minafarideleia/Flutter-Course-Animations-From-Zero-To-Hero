import 'package:flutter/material.dart';

class PageFadeTransition extends PageRouteBuilder {
  final dynamic page;

  PageFadeTransition(this.page)
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return Align(
                alignment: Alignment.center,
                child: FadeTransition(opacity: animation, child: child),
              );
            });
}

import 'package:flutter/material.dart';

class PageMixSizeFadeTransition extends PageRouteBuilder {
  final dynamic page;

  PageMixSizeFadeTransition(this.page)
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return Align(
                  alignment: Alignment.center,
                  child: SizeTransition(
                    sizeFactor: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ));
            });
}

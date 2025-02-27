import 'package:flutter/material.dart';

class AnimationUtils {
  static const int transitionSpeed = 500; //ms

  ////
  /// Slide given screen from bottom to top
  ///
  static Route<T> createBottomToTopRoute<T>(Widget screen) {
    const begin = Offset(0.0, 0.0);         //  TODO
    const end = Offset(0.0, 0.0);           //  TODO
    return _createAnimatedRoute(screen, begin, end);
  }

  static Route<T> _createAnimatedRoute<T>(
      Widget screen, Offset begin, Offset end) {
    return PageRouteBuilder<T>(
      transitionDuration:
          const Duration(milliseconds: transitionSpeed), // Animation speed
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

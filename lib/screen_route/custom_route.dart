import 'package:flutter/widgets.dart';

/// CustomRoute class
///
/// This class is a custom [PageRouteBuilder] that provides a slide transition animation
/// for navigating between screens. It allows you to specify the [offset] to control the
/// direction and distance of the slide animation.
class CustomRoute extends PageRouteBuilder {
  final Widget page;
  final Offset offset;

  /// Constructor for CustomRoute
  ///
  /// The [page] parameter is the widget to be displayed on the new screen.
  /// The [offset] parameter is the starting position of the slide animation.
  CustomRoute({required this.page, required this.offset})
      : super(
    // Duration for the reverse transition animation (when popping the route)
    reverseTransitionDuration: const Duration(milliseconds: 600),
    // Duration for the transition animation (when pushing the route)
    transitionDuration: const Duration(milliseconds: 600),
    // PageBuilder for creating the new screen
    pageBuilder: ((context, animation, secondaryAnimation) {
      // Define the begin and end positions for the slide animation
      final begin = offset;
      const end = Offset.zero;
      // Create a tween to animate the slide transition
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeIn));
      // Use a SlideTransition widget to apply the animation to the page
      return SlideTransition(
        position: animation.drive(tween),
        child: page,
      );
    }),
    // TransitionsBuilder for creating the slide animation
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Define the begin and end positions for the slide animation
      final begin = offset;
      const end = Offset(0, 0);
      const curve = Curves.easeInOutSine;
      // Create a tween to animate the slide transition
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // Use a SlideTransition widget to apply the animation to the child widget
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


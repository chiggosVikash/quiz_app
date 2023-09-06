import 'package:flutter/material.dart';

/// An extension to provide convenient access to media query properties using BuildContext.
extension MediaQueryExtension on BuildContext {
  /// Gets the height of the screen.
  double get height => MediaQuery.of(this).size.height;

  /// Gets the width of the screen.
  double get width => MediaQuery.of(this).size.width;

  /// Gets the aspect ratio of the screen.
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
}
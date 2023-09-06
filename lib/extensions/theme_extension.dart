
import 'package:flutter/material.dart';


/// An extension to provide convenient access to theme-related properties using BuildContext.
extension ThemeExtension on BuildContext {
  /// Gets the current [ThemeData] from the current [BuildContext].
  ///
  /// Returns the [ThemeData] instance associated with the current [BuildContext].
  ThemeData get themeData {
    return Theme.of(this);
  }

  /// Gets the current app's [TextTheme] from the [ThemeData].
  ///
  /// Returns the [TextTheme] instance associated with the current [BuildContext]'s theme.
  TextTheme get appTextTheme {
    return Theme.of(this).textTheme;
  }
}

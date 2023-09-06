
import 'dart:math';

/// An extension to provide additional methods to [Random] objects.
extension RandomExtension on Random {
  /// Generates a random opacity value.
  ///
  /// Generates a random opacity value between 0.4 and 1.0.
  /// If the generated random number is less than 0.2, the minimum opacity (0.4) is returned.
  double get opacity {
    /// Define the minimum opacity value.
    const double minOpacity = 0.4;

    /// Generate a random double between 0.0 (inclusive) and 1.0 (exclusive).
    final randomNo = nextDouble();

    /// Check if the generated random number is less than 0.2.
    if (randomNo < 0.2) {
      return minOpacity; // Return the minimum opacity.
    }

    /// Return the generated random opacity value.
    return randomNo;
  }
}

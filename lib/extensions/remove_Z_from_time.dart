/// An extension to provide a method for removing 'Z' from a [String].
extension RemoveZFromTime on String {
  /// Removes the 'Z' character from a string if present.
  ///
  /// If the string contains a 'Z' character at the end, it is removed.
  /// Otherwise, the original string is returned unchanged.
  String get removeZFromDate {
    /// Check if the string contains the 'Z' character.
    if (contains("Z")) {
      /// Replace the last character of the string (which is 'Z') with an empty character.
      return replaceRange(length - 1, length, "");
    } else {
      /// If the string does not contain 'Z', return the original string.
      return this;
    }
  }
}


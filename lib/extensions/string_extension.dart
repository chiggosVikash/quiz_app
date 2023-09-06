
/// An extension to provide additional methods for manipulating strings.
extension StringExtension on String {
  /// Converts the first character of the string to uppercase.
  ///
  /// If the string's length is greater than 1, the first character is converted to uppercase
  /// and the resulting string is returned.
  /// If the string's length is 1 or less, the entire string is converted to uppercase.
  String get firstCharToUpper {
    /// Check if the string's length is greater than 1.
    if (length > 1) {
      /// Get the first character of the string.
      final firstChar = substring(0, 1);

      /// Replace the first character with its uppercase equivalent.
      final convertedStr = replaceRange(0, 1, firstChar.toUpperCase());
      return convertedStr;
    } else {
      /// If the string's length is 1 or less, convert the entire string to uppercase.
      return toUpperCase();
    }
  }
}

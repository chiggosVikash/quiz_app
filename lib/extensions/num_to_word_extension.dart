
/// A Dart extension to convert numeric values into their corresponding English word representations.
///
/// This extension provides a convenient way to convert integer values into words, suitable for
/// scenarios such as displaying numbers in a human-readable format in your Flutter application.
extension NumToWord on int {

  /// List of word representations for numbers from 1 to 19.
  static final _firstTwenty = [
    "","One","Two","Three","Four","Five",
    "Six","Seven","Eight","Nine","Ten",
    "Eleven","Twelve","Thirteen","Fourteen",
    "Fifteen","Sixteen","Seventeen","Eighteen",
    "Nineteen",
  ];

  /// List of word representations for tens from 20 to 90.
  static final _tens = ["","", "Twenty", "Thirty",
    "Forty",   "Fifty",  "Sixty",
    "Seventy", "Eighty", "Ninety",];

  /// Converts the integer into its English word representation.
  ///
  /// This method takes an integer value and returns its English word representation.
  /// The conversion follows the standard English naming conventions for numbers,
  /// such as "twenty-one" or "one hundred twenty-three".

  String get numIntoWord{
    return _numToWord(this);
  }

  /// Converts a given [number] into its English word representation.
  ///
  /// The method breaks down the given [number] into its component parts,
  /// such as thousands, hundreds, tens, and ones. It then constructs
  /// the English word representation by combining these parts appropriately.

  String _numToWord (int number){

    final lakhs = _saperetarValue(num: number ~/ 100000,prefix:"lac");
    number = number % 100000;
    final thousands = _saperetarValue(num:number ~/ 1000,prefix:"thousand");
    number = number % 1000;
    final hundreds = _saperetarValue(num:number ~/ 100,prefix:"hundred");
    number = number % 100;
    final tens = _tensSeperater(num:number);

    var answer = "$lakhs $thousands $hundreds $tens";

    return answer;


  }

  /// Separates the tens and ones place values and returns the corresponding English representation.
  ///
  /// If the given [num] is less than 20, this method returns the word representation from the _firstTwenty list.
  /// Otherwise, it calculates the appropriate tens value and combines it with the corresponding ones value.
  String _tensSeperater({required int num}){
    if(num < 20){
      return _firstTwenty[num];
    }

    final tenValue = _tens[num ~/ 10];
    num = num % 10;
    final onesValue = _firstTwenty[num];
    return "$tenValue $onesValue";

  }

  /// Returns the separated value with its corresponding [prefix].
  ///
  /// This method separates the value into tens and ones and then appends the provided [prefix]
  /// to create a coherent representation, like "twenty thousand" or "three hundred".
  String _saperetarValue({required int num,required String prefix}){

    var value = _tensSeperater(num:num);
    if(value.isNotEmpty){
      return "$value $prefix";
    }
    return value;

  }
}
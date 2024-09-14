import 'package:intl/intl.dart';

const int _decimalDigits = 2;

/// A number format for compact representations,
/// e. g. "1.2M" instead of "1,200,000".
String compactFormat(num? number) =>
    number != null ? NumberFormat.compact().format(number) : '-';

/// A number format for compact currency representations,
/// e. g. "$1.2M" instead of "$1,200,000".
String compactCurrencyFormat(num? number) =>
    number != null ? NumberFormat.compactSimpleCurrency().format(number) : '-';

/// A number format for percentage representations.
String percentageFormat(num? number) => number != null
    ? '${NumberFormat.decimalPatternDigits(decimalDigits: _decimalDigits).format(number)}%'
    : '-';

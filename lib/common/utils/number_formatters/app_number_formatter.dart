import 'package:intl/intl.dart';

/// A number format for compact representations,
/// e. g. "1.2M" instead of "1,200,000".
String compactFormat(num? number) =>
    number != null ? NumberFormat.compact().format(number) : '-';

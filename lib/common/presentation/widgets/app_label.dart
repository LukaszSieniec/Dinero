import 'package:flutter/material.dart';

class AppLabel extends StatelessWidget {
  final String label;

  final TextStyle style;

  // How the text should be aligned horizontally.
  final TextAlign? textAlign;

  // How visual overflow should be handled.
  final TextOverflow? overflow;

  const AppLabel({
    required this.label,
    required this.style,
    this.textAlign,
    this.overflow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}

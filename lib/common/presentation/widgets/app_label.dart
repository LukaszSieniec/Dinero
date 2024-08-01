import 'package:flutter/material.dart';

class AppLabel extends StatelessWidget {
  final String label;

  final TextStyle style;

  const AppLabel({
    required this.label,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: style,
    );
  }
}

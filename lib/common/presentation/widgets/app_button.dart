import 'package:dinero/common/presentation/widgets/app_label.dart';
import 'package:flutter/material.dart';

enum Button {
  elevated,
  outlined,
}

class AppButton extends StatelessWidget {
  final String label;

  final Color? labelColor;

  // If the [AppButton] is disabled, the [onPressed] method is null.
  final VoidCallback? onPressed;

  final Button button;

  const AppButton.elevated({
    required this.label,
    this.labelColor,
    this.onPressed,
    this.button = Button.elevated,
    super.key,
  });

  const AppButton.outlined({
    required this.label,
    this.labelColor,
    this.onPressed,
    this.button = Button.outlined,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return button == Button.elevated
        ? ElevatedButton(
            onPressed: onPressed,
            child: AppLabel(
              label: label,
              style: Theme.of(context).textTheme.labelLarge!,
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            child: AppLabel(
              label: label,
              style: Theme.of(context).textTheme.labelLarge!,
            ),
          );
  }
}

import 'package:flutter/material.dart';

class UiButton extends StatelessWidget {
  const UiButton._internal({
    required this.isOutline,
    this.child,
    this.color,
    this.text,
    this.onPressed,
  });

  factory UiButton.compact({
    required Color color,
    Widget? child,
    required VoidCallback onPressed,
    required String text,
  }) =>
      UiButton._internal(
        isOutline: false,
        color: color,
        onPressed: onPressed,
        text: text,
        child: child,
      );

  final Widget? child;
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<OutlinedBorder?> shape =
        MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: const BorderSide(
          color: Color.fromARGB(255, 27, 27, 27),
        ),
      ),
    );
    final size = MaterialStateProperty.all<Size?>(const Size(130, 42));
    final buttonChild = child ??
        Text(
          text!,
          textAlign: TextAlign.center,
        );

    final button = isOutline
        ? OutlinedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              fixedSize: size,
              shape: shape,
            ),
            child: buttonChild,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(color),
              fixedSize: size,
              shape: shape,
            ),
            child: buttonChild,
          );

    return ButtonTheme(
      minWidth: 300,
      height: 40,
      child: button,
    );
  }
}

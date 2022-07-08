import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double? fontSize;

  const AppRoundedButton({
    required this.onPressed,
    required this.label,
    this.fontSize = 25.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: Colors.white,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

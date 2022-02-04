import 'package:flutter/material.dart';
import '../vakinha_ui.dart';

class IconBadge extends StatelessWidget {
  final int number;
  final IconData icon;

  const IconBadge({
    required this.number,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(icon),
        Visibility(
          visible: number > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              maxRadius: 9,
              backgroundColor: Colors.red,
              child: Text(
                '$number',
                style: VakinhaUi.boldText.copyWith(fontSize: 9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

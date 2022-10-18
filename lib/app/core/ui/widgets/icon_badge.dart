import 'package:flutter/material.dart';

import '../vakinha_ui.dart';

class IconBadge extends StatelessWidget {
  final int number;
  final IconData icon;

  const IconBadge({
    required this.number,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon),
        Visibility(
          visible: number > 0,
          child: Positioned(
            top: -5,
            right: -10,
            child: CircleAvatar(
              maxRadius: 9,
              backgroundColor: Colors.red,
              child: Text(
                '$number',
                style: VakinhaUi.boldText.copyWith(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

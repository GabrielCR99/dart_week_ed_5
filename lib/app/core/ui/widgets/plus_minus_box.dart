import 'package:flutter/material.dart';

import '../formatter_helper.dart';
import 'app_rounded_button.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int amount;
  final double price;
  final VoidCallback plusCallback;
  final VoidCallback minusCallback;
  final bool calculateTotal;

  const PlusMinusBox({
    required this.amount,
    required this.price,
    required this.plusCallback,
    required this.minusCallback,
    this.elevated = false,
    this.backgroundColor,
    this.label,
    this.calculateTotal = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Row(
              children: [
                AppRoundedButton(
                  label: '-',
                  onPressed: minusCallback,
                ),
                Text('$amount'),
                AppRoundedButton(
                  label: '+',
                  onPressed: plusCallback,
                ),
              ],
            ),
            Visibility(visible: label == null, child: const Spacer()),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10),
              constraints: const BoxConstraints(minWidth: 70),
              child: Text(
                FormatterHelper.format(
                  calculateTotal ? price * amount : price,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

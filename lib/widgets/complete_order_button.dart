import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CompleteOrderButton extends StatelessWidget {
  final VoidCallback onTap;
  final double totalToPay;

  const CompleteOrderButton(
      {super.key, required this.onTap, required this.totalToPay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: Ink(
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: SkiResortTheme.primaryButtonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                "Pay ${totalToPay.toStringAsFixed(2)} €",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

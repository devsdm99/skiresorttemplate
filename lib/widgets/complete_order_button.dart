import 'package:flutter/material.dart';
import 'package:skiresorttemplate/ui/ui.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const PrimaryButton({super.key, required this.onTap, required this.text});

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
              color: StylesUI.primaryButtonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: StylesUI.titleStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const AddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: Colors.yellow.shade700,
        height: 30,
        width: 30,
        child: Center(
          child: Text("+", style: Theme.of(context).textTheme.labelSmall),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const RemoveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: Colors.yellow.shade700,
        height: 30,
        width: 30,
        child: const Center(child: Icon(Icons.delete)),
      ),
    );
  }
}

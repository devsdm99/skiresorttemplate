import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  final VoidCallback onPressed;
  const BackArrowButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.arrow_back_ios,
        size: 10,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}

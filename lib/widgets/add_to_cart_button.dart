import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddToCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: Ink(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              color: SkiResortTheme.primaryButtonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Add to cart",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const Icon(Icons.shopping_basket)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

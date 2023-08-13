import 'package:flutter/material.dart';
import 'package:skiresorttemplate/ui/ui.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddToCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 10),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add to cart", style: StylesUI.titleStyle),
                  const SizedBox(
                    width: 10,
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

import 'package:flutter/material.dart';
import 'package:skiresorttemplate/ui/ui.dart';

class BigMenuButtonWidget extends StatelessWidget {
  const BigMenuButtonWidget({super.key, required this.imgPath, required this.text});

  final String imgPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 260,
        height: 140,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            imgPath,
          ),
        )),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 35,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                )),
            child: Center(
              child: Text(
                text,
                style: StylesUI.homeBigMenuButtonStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

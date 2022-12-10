import 'package:flutter/material.dart';
import 'package:skiresorttemplate/ui/ui.dart';
class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({Key? key, required this.iconData, required this.text})
      : super(key: key);

  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                iconData,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(text, style: StylesUI.homeMenuButtonStyle)
        ],
      ),
    );
  }
}

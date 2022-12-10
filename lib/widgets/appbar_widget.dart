import 'package:flutter/material.dart';
import 'package:skiresorttemplate/helpers/helpers.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: const [
              _CartIcon(),
              _ItemsInCart(),
            ],
          ),
        )
      ],
      title: const _AppBarLogo(),
    );
  }
}

class _CartIcon extends StatelessWidget {
  const _CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.shopping_cart,
      color: Colors.black,
      size: 42,
    );
  }
}

class _ItemsInCart extends StatelessWidget {
  const _ItemsInCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 4,
      child: CircleAvatar(
        radius: 10,
        backgroundColor: Colors.red,
        child: Center(
          child: Text(
            "2",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}

class _AppBarLogo extends StatelessWidget {
  const _AppBarLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesHelper.mainLogo,
      height: 70,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/helpers/helpers.dart';
import 'package:skiresorttemplate/providers/cart_provider.dart';
import 'package:skiresorttemplate/ui/styles_ui.dart';

import 'widgets.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showCart;
  final bool isMainScreen;

  const AppbarWidget(
      {super.key, this.title, this.showCart = true, this.isMainScreen = true});

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: isMainScreen ? false : true,
      backgroundColor: StylesUI.backgroundColor,
      leading: isMainScreen
          ? null
          : BackArrowButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      actions: [
        showCart
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "CartScreen"),
                  child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      _CartIcon(),
                      //_ItemsInCart(),
                    ],
                  ),
                ),
              )
            : Container()
      ],
      title: isMainScreen
          ? const _AppBarLogo()
          : Text(
              title ?? "",
              style: Theme.of(context).textTheme.titleSmall,
            ),
    );
  }
}

class _CartIcon extends StatelessWidget {
  const _CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.notifications,
      color: Theme.of(context).iconTheme.color,
      size: 32,
    );
  }
}

class _ItemsInCart extends StatelessWidget {
  const _ItemsInCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<CartProvider, int>(
      selector: (_, provider) => provider.items.length,
      builder: (context, value, child) {
        return CircleAvatar(
          radius: 10,
          backgroundColor: StylesUI.primaryColor,
          child: Center(
            child: Text(
              value.toString(),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
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

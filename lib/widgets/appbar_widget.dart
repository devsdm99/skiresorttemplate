import 'package:flutter/material.dart';
import 'package:skiresorttemplate/helpers/helpers.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(55);


  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: Colors.white,
          title: const _AppBarLogo(),
        );
  }
}

class _AppBarLogo extends StatelessWidget {
  const _AppBarLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      ImagesHelper.mainLogo,
      height: 70,
    ));
  }
}


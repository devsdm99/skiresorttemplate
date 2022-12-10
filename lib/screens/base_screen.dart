import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/providers/providers.dart';
import 'package:skiresorttemplate/screens/screens.dart';
import 'package:skiresorttemplate/widgets/widgets.dart';

class BaseScreen extends StatelessWidget {
  static const routeName = "BaseScreen";

  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const AppbarWidget(),
          bottomNavigationBar: const NavBarWidget(),
          body: Selector<NavProvider, int>(
            selector: (p0, provider) => provider.currentIndex,
            builder: (context, value, child) {
              return _getBody(value);
            },
          )),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const NotificationsScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}

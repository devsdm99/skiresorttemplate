import 'package:flutter/material.dart';
import 'package:skiresorttemplate/screens/buy_forfait_screen.dart';
import 'package:skiresorttemplate/screens/screens.dart';

class AppRoutes {
  static String initialRoute = LoginScreen.routeName;
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      BaseScreen.routeName: (BuildContext context) => const BaseScreen(),
      HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
      LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
      BuyForfaitScreen.routeName: (BuildContext context) =>
          const BuyForfaitScreen(),
    });

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    );
  }
}

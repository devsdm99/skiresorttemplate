import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/providers/payment_provider.dart';
import 'package:skiresorttemplate/providers/providers.dart';
import 'package:skiresorttemplate/screens/screens.dart';

import 'router/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BaseProvider()),
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => NavProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => ForfaitProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => CardProvider()),
          ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: BaseScreen.routeName,
          routes: AppRoutes.getAppRoutes(),
          //darkTheme: SkiResortTheme.darkTheme,
          //theme: SkiResortTheme.lightTheme,
        ));
  }
}

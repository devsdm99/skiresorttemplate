import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/providers/providers.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final NavProvider navbarProvider =
        Provider.of<NavProvider>(context, listen: false);
        
    return Selector<NavProvider, int>(
      selector: (_, provider) => provider.currentIndex,
      builder: (context, currentIndex, child) {
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey.shade800,
          selectedItemColor: Colors.white,
          items: NavProvider.items,
          currentIndex: currentIndex,
          onTap: (value) {
            navbarProvider.currentIndex = value;
          },
        );
      },
    );
  }
}

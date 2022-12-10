import 'package:flutter/material.dart';
import 'package:skiresorttemplate/providers/base_provider.dart';

class NavProvider extends BaseProvider {
  static final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    const BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];
  
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

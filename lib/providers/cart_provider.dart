import 'package:flutter/cupertino.dart';
import 'package:skiresorttemplate/models/models.dart';

class CartProvider with ChangeNotifier {
  List<ItemCartModel>? _items;

  List<ItemCartModel> get items => _items ?? [];

  void addItemToCart(ItemCartModel item) {
    _items?.add(item);
    notifyListeners();
  }
}

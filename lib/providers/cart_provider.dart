import 'package:flutter/cupertino.dart';
import 'package:skiresorttemplate/models/forfait_category_model.dart';
import 'package:skiresorttemplate/models/models.dart';

import 'forfait_provider.dart';

class CartProvider with ChangeNotifier {
  final List<ItemCartModel> _items = [];
  final double _tax = 5.75;
  final double _discount = 0.0;

  double _total = 0.0;
  List<ItemCartModel> get items => _items;
  double get tax => _tax;
  double get discount => _discount;
  double get subtotal => _total;
  double get total => _total + tax - discount;

  set total(double value) {
    _total = value;
    notifyListeners();
  }

  void calculateTotal() {
    double totalTmp = 0.0;
    for (var item in _items) {
      totalTmp += item.price! * item.quantity!;
    }
    _total = totalTmp;
  }

  void addItemToCart(ItemCartModel item) {
    _items.add(item);
    calculateTotal();
    notifyListeners();
  }

  void removeItemFromCart(ItemCartModel item) {
    _items.remove(item);
    calculateTotal();
    notifyListeners();
  }

  void addQuantityToItem(ItemCartModel item) {
    item.quantity = (item.quantity ?? 0) + 1;
    calculateTotal();
    notifyListeners();
  }

  void removeQuantityToItem(ItemCartModel item) {
    item.quantity = (item.quantity ?? 0) - 1;
    calculateTotal();
    notifyListeners();
  }

  double getPriceForCategory(ForfaitCategory category) {
    switch (category) {
      case ForfaitCategory.adult:
        return ForfaitProvider.adultForfaitPrice;
      case ForfaitCategory.junior:
        return ForfaitProvider.juniorForfaitPrice;
      case ForfaitCategory.child:
        return ForfaitProvider.childForfaitPrice;
      default:
        return 0.0;
    }
  }

  void addForfaitsToCart(
      int adultForfaits, int juniorForfaits, int childForfaits, DateTime date) {
    //check if there is already a forfait in the cart of the same type, if exists, update the quantity

    // Create a map to store the quantities for each ForfaitCategory
    var quantities = {
      ForfaitCategory.adult: adultForfaits,
      ForfaitCategory.junior: juniorForfaits,
      ForfaitCategory.child: childForfaits,
    };

// Iterate through the ForfaitCategories and update quantities if needed
    for (var category in quantities.keys) {
      var hasForfait = items.any((element) => element.type == category);
      if (!hasForfait && (quantities[category] ?? 0) > 0) {
        items.add(ItemCartModel(
            name: 'Day pass',
            type: category,
            price: getPriceForCategory(
                category), // Replace with appropriate price retrieval method
            quantity: quantities[category],
            date: date));
      } else {
        // Update quantities for existing items
        for (var item in items) {
          if (item.type == category) {
            item.quantity = (item.quantity ?? 0) + (quantities[category] ?? 0);
          }
        }
      }
    }

    calculateTotal();
    notifyListeners();
  }
}

import 'package:skiresorttemplate/providers/forfait_provider.dart';

import '../models/models.dart';

class CartHelper {
  static List<ItemCartModel> items = [
    ItemCartModel(
        date: DateTime.now(),
        name: "Day Pass",
        price: ForfaitProvider.adultForfaitPrice,
        quantity: 3,
        type: ForfaitCategory.adult)
  ];
}

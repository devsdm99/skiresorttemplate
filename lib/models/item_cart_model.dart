import 'package:skiresorttemplate/models/forfait_category_model.dart';

class ItemCartModel {
  ItemCartModel(
      {required this.name,
      required this.type,
      required this.price,
      required this.quantity,
      required this.date});

  String name;
  ForfaitCategory type;
  double price;
  int quantity;
  DateTime date;
}

import 'package:skiresorttemplate/models/forfait_category_model.dart';

class ItemCartModel {
  ItemCartModel(
      {this.name, this.type, this.price, this.quantity, required this.date});

  String? name;
  ForfaitCategory? type;
  double? price;
  int? quantity;
  DateTime date;
}

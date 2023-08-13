import 'package:skiresorttemplate/models/payment_enum.dart';

class PaymentModel {
  PaymentEnum paymentType;
  String title;
  bool isSelected;

  PaymentModel(
      {required this.paymentType,
      required this.title,
      required this.isSelected});
}

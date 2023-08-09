import 'package:skiresorttemplate/models/models.dart';

class ClassHelper {
  static List<CreditCardModel> cards = [
    CreditCardModel(
        cardNumber: "1234 1234 1234 1234",
        cardHolderName: "John Deep",
        expiryDate: DateTime(2024, 10, 10),
        cvvCode: "123"),
    CreditCardModel(
        cardNumber: "1234 1234 1234 4123",
        cardHolderName: "Bad Bunnny",
        expiryDate: DateTime(2024, 08, 23),
        cvvCode: "432"),
    CreditCardModel(
        cardNumber: "1234 1234 1234 5123",
        cardHolderName: "Maria becerra",
        expiryDate: DateTime(2024, 11, 20),
        cvvCode: "531")
  ];
}

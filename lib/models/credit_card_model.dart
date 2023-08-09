class CreditCardModel {
  String cardNumber;
  String cardHolderName;
  DateTime expiryDate;
  String cvvCode;

  CreditCardModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvvCode,
  });
}

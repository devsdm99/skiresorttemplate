import 'package:flutter/material.dart';
import 'package:skiresorttemplate/models/models.dart';

class CardHelper {
  static List<CreditCardModel> cards = [
    CreditCardModel(
        cardNumber: "1234 1234 1234 1234",
        cardHolderName: "John Deep",
        expiryDate: DateTime(2024, 10, 10),
        cvvCode: "123",
        isSelected: true),
    CreditCardModel(
        cardNumber: "1234 1234 1234 4123",
        cardHolderName: "Bad Bunnny",
        expiryDate: DateTime(2024, 08, 23),
        cvvCode: "432",
        isSelected: false),
    CreditCardModel(
        cardNumber: "1234 1234 1234 5123",
        cardHolderName: "Maria becerra",
        expiryDate: DateTime(2024, 11, 20),
        cvvCode: "531",
        isSelected: false),
  ];

  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.visa;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CardType.americanExpress;
    } else if (input.length <= 8) {
      cardType = CardType.others;
    } else {
      cardType = CardType.invalid;
    }
    return cardType;
  }

  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.master:
        img = 'mastercard.png';
        break;
      case CardType.visa:
        img = 'visa.png';
        break;
      case CardType.americanExpress:
        img = 'american_express.png';
        break;
      case CardType.others:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/cards/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }
}

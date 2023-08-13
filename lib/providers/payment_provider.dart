import 'package:flutter/material.dart';

import '../models/models.dart';

class PaymentProvider extends ChangeNotifier {
  static List<PaymentModel> payments = [
    PaymentModel(
        title: "Credit", paymentType: PaymentEnum.credit, isSelected: true),
    PaymentModel(
        title: "PayPal", paymentType: PaymentEnum.paypal, isSelected: false),
    PaymentModel(
        title: "Wallet", paymentType: PaymentEnum.wallet, isSelected: false),
    PaymentModel(
        title: "Other", paymentType: PaymentEnum.other, isSelected: false),
  ];

  PaymentModel _selectedPaymentMethod = payments[0];
  CardType? cardType;
  bool _savePaymentDetails = false;

  PaymentModel get selectedPaymentMethod => _selectedPaymentMethod;
  CardType? get selectedCardType => cardType;
  bool get savePaymentDetails => _savePaymentDetails;

  set selectedPaymentMethod(PaymentModel value) {
    payments.firstWhere((payment) => payment.isSelected).isSelected = false;
    value.isSelected = true;
    _selectedPaymentMethod = value;

    notifyListeners();
  }

  set selectedCardType(CardType? value) {
    cardType = value;
    notifyListeners();
  }

  set savePaymentDetails(bool value) {
    _savePaymentDetails = value;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/helpers/helpers.dart';
import 'package:skiresorttemplate/providers/payment_provider.dart';
import 'package:skiresorttemplate/providers/providers.dart';
import 'package:skiresorttemplate/screens/paypal_payment_screen.dart';
import 'package:skiresorttemplate/ui/ui.dart';
import 'package:skiresorttemplate/widgets/widgets.dart';

import '../models/models.dart';
import 'base_screen.dart';

class PaymentDataScreen extends StatelessWidget {
  static const routeName = "CheckoutScreen";

  const PaymentDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarWidget(
          isMainScreen: false,
          showCart: false,
          title: "Payment data ",
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, left: 12, right: 12),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: StylesUI.heading,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "\$ ${cartProvider.total}",
                              style: StylesUI.titleStyle.copyWith(
                                  color: StylesUI.primaryColor, fontSize: 30),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Payment Method",
                              style: StylesUI.heading,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 70,
                              child: _PaymentMethods(),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            _buildPaymentForms(context),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Use promo code",
                              style: StylesUI.heading,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(20),
                                CardNumberInputFormatter()
                              ],
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "Promo code",
                                  filled: true,
                                  fillColor: Colors.grey[200]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const _CompletePaymentButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PaymentMethods extends StatelessWidget {
  const _PaymentMethods();

  @override
  Widget build(BuildContext context) {
    final PaymentProvider payments =
        Provider.of<PaymentProvider>(context, listen: false);
    return ListView.builder(
      shrinkWrap: false,
      scrollDirection: Axis.horizontal,
      itemCount: PaymentProvider.payments.length,
      itemBuilder: (context, index) {
        final payment = PaymentProvider.payments[index];
        return Selector<PaymentProvider, PaymentModel>(
          selector: (_, provider) => provider.selectedPaymentMethod,
          builder: (_, selectedPaymentMethod, __) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () {
                  payments.selectedPaymentMethod = payment;
                },
                child: Ink(
                  width: 140,
                  decoration: BoxDecoration(
                    color: payment.isSelected
                        ? StylesUI.primaryColor
                        : StylesUI.primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        payment.title,
                        style:
                            StylesUI.titleStyle.copyWith(color: StylesUI.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.check_circle_outline,
                        color: StylesUI.white,
                        size: 40,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _CompletePaymentButton extends StatelessWidget {
  const _CompletePaymentButton();

  @override
  Widget build(BuildContext context) {
    final paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        switch (paymentProvider.selectedPaymentMethod.paymentType) {
          case PaymentEnum.paypal:
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PaypalPayment(
                  onFinish: (number) async {},
                ),
              ),
            );
            break;
          case PaymentEnum.credit:
            // TODO: Handle this case.
            break;
          case PaymentEnum.wallet:
            // TODO: Handle this case.
            break;
          case PaymentEnum.other:
            // TODO: Handle this case.
            break;
        }
        cartProvider.clearCart();
        const snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: Text("Payment completed"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context)
            .popUntil(ModalRoute.withName(BaseScreen.routeName));
      },
      child: Ink(
        height: 75,
        width: double.infinity,
        decoration: const BoxDecoration(color: StylesUI.primaryButtonColor),
        child: Center(
          child: Text("COMPLETE PAYMENT", style: StylesUI.heading),
        ),
      ),
    );
  }
}

class _CardPaymentForm extends StatelessWidget {
  const _CardPaymentForm();

  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider =
        Provider.of<CardProvider>(context, listen: false);
    return cardProvider.selectedCard == null
        ? const _AddCardForm()
        : const _CurrentSelectedCardForm();
  }
}

class _CurrentSelectedCardForm extends StatelessWidget {
  const _CurrentSelectedCardForm();

  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider =
        Provider.of<CardProvider>(context, listen: false);
    CardType type = CardHelper.getCardTypeFrmNumber(
        cardProvider.selectedCard?.cardNumber ?? "");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Selected card", style: StylesUI.heading),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text("Change",
                  style: StylesUI.bodyStyle
                      .copyWith(color: StylesUI.primaryColor)),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: StylesUI.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CardHelper.getCardIcon(type) ?? const Icon(Icons.credit_card),
                const SizedBox(
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(cardProvider.selectedCard?.cardHolderName ?? "",
                          style: StylesUI.titleStyle),
                      Text(
                          "Owner card ending **${cardProvider.selectedCard?.cardNumber.substring(cardProvider.selectedCard!.cardNumber.length - 2)}",
                          style: StylesUI.bodyStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _AddCardForm extends StatefulWidget {
  const _AddCardForm();

  @override
  State<_AddCardForm> createState() => _AddCardFormState();
}

class _AddCardFormState extends State<_AddCardForm> {
  TextEditingController cardNumberController = TextEditingController();
  CardType cardType = CardType.invalid;

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = CardHelper.getCleanedNumber(cardNumberController.text);
      CardType type = CardHelper.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  void initState() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PaymentProvider paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: cardNumberController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(20),
              CardNumberInputFormatter()
            ],
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Card number",
                suffix: CardHelper.getCardIcon(cardType),
                filled: true,
                fillColor: Colors.grey[200]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Full name",
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "CVV",
                      filled: true,
                      fillColor: Colors.grey[200]),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    CardMonthInputFormatter(),
                  ],
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "MM/YY",
                      filled: true,
                      fillColor: Colors.grey[200]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Save card data for future payments",
                style: StylesUI.bodyStyle,
              ),
              Selector<PaymentProvider, bool>(
                selector: (_, selector) => selector.savePaymentDetails,
                builder: (context, value, child) {
                  return CupertinoSwitch(
                    activeColor: StylesUI.primaryColor,
                    value: value,
                    onChanged: (value) {
                      paymentProvider.savePaymentDetails = value;
                    },
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildPaymentForms(BuildContext context) {
  final PaymentProvider payments =
      Provider.of<PaymentProvider>(context, listen: true);
  switch (payments.selectedPaymentMethod.paymentType) {
    case PaymentEnum.paypal:
      return const Text("Paypal");
    case PaymentEnum.credit:
      return const _CardPaymentForm();
    case PaymentEnum.wallet:
      return const Text("Wallet");
    case PaymentEnum.other:
      return const Text("Other");
  }
}

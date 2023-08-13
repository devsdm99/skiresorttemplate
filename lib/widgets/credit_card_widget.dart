import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/providers/providers.dart';
import 'package:skiresorttemplate/ui/styles_ui.dart';

import '../models/models.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCardModel card;
  const CreditCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          context.read<CardProvider>().selectedCard = card;
        },
        child: Ink(
          width: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                card.isSelected
                    ? Theme.of(context).primaryColor
                    : StylesUI.primaryButtonColor,
                card.isSelected
                    ? Theme.of(context).primaryColor
                    : StylesUI.primaryButtonColor.withOpacity(0.8)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/cards/visa.png",
                      height: 100,
                    ),
                    card.isSelected
                        ? const SizedBox(
                            height: 25,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.check_circle,
                                color: Color.fromARGB(255, 0, 255, 8),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Card Number", style: StylesUI.titleStyle),
                        Text(
                          "**** **** **** ${card.cardNumber.substring(card.cardNumber.length - 5)}",
                          style: StylesUI.bodyStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Valid until", style: StylesUI.titleStyle),
                        Text(DateFormat("MM/yy").format(card.expiryDate),
                            style: StylesUI.bodyStyle),
                      ],
                    )
                  ],
                ),
                Text(
                  card.cardHolderName,
                  style: StylesUI.titleStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

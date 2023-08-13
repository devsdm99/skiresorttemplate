import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/providers/providers.dart';
import 'package:skiresorttemplate/ui/styles_ui.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "CartScreen";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: const AppbarWidget(
        title: "My cart",
        showCart: false,
        isMainScreen: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 100,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                      child: Text(
                        "${context.watch<CartProvider>().items.length} items in cart",
                        style: StylesUI.homeBigMenuButtonStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _OrderDetails(cartProvider: cartProvider),
                    const SizedBox(
                      height: 30,
                    ),
                    cartProvider.items.isNotEmpty
                        ? _OrderResume(cartProvider: cartProvider)
                        : Center(
                            child: Text(
                              "Your cart is empty",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: PrimaryButton(
              onTap: () => {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    context: context,
                    builder: (context) => const _PaymentCards())
              },
              text: "Pay ${cartProvider.total.toStringAsFixed(2)} €",
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderResume extends StatelessWidget {
  const _OrderResume({
    required this.cartProvider,
  });

  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Subtotal(cartProvider: cartProvider),
        const SizedBox(
          height: 10,
        ),
        _Tax(cartProvider: cartProvider),
        const SizedBox(
          height: 10,
        ),
        _Total(cartProvider: cartProvider),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}

class _Total extends StatelessWidget {
  const _Total({
    required this.cartProvider,
  });

  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total:",
            style: StylesUI.titleStyle,
          ),
          Text(
            "${cartProvider.total.toStringAsFixed(2)} €",
            style: StylesUI.titleStyle,
          ),
        ],
      ),
    );
  }
}

class _Tax extends StatelessWidget {
  const _Tax({
    required this.cartProvider,
  });

  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tax:",
            style: StylesUI.heading,
          ),
          Text(
            "${cartProvider.tax.toStringAsFixed(2)} €",
            style: StylesUI.heading,
          ),
        ],
      ),
    );
  }
}

class _Subtotal extends StatelessWidget {
  const _Subtotal({
    required this.cartProvider,
  });

  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Subtotal:",
            style: StylesUI.heading,
          ),
          Text(
            "${cartProvider.subtotal.toStringAsFixed(2)} €",
            style: StylesUI.heading,
          ),
        ],
      ),
    );
  }
}

class _PaymentCards extends StatelessWidget {
  const _PaymentCards();

  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider =
        Provider.of<CardProvider>(context, listen: true);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text("Select a card", style: StylesUI.titleStyle)),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Text("Tap to select a card",
                          style: StylesUI.bodyStyle)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child: cardProvider.cards.isEmpty
              ? Center(
                  child: Text(
                  "Add a new card in the next step",
                  style: StylesUI.heading,
                ))
              : PageView.builder(
                  itemCount: cardProvider.cards.length,
                  itemBuilder: (context, index) {
                    final card = cardProvider.cards[index];
                    return CreditCardWidget(card: card);
                  },
                ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(50, 50),
                  backgroundColor: StylesUI.primaryButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              onPressed: () {
                Navigator.pushNamed(context, PaymentDataScreen.routeName);
              },
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
      ],
    );
  }
}

class _OrderDetails extends StatelessWidget {
  const _OrderDetails({
    required this.cartProvider,
  });

  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cartProvider.items.map((forfait) {
        final String forfaitType;
        switch (forfait.type) {
          case ForfaitCategory.adult:
            forfaitType = "Adult";
            break;
          case ForfaitCategory.junior:
            forfaitType = "Junior";
            break;
          default:
            forfaitType = "Child";
            break;
        }

        return Dismissible(
          key: Key("${forfait.name} ${cartProvider.items.indexOf(forfait)}"),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            cartProvider.removeItemFromCart(forfait);
          },
          child: _DetailCartItem(
            forfait: forfait,
            forfaitType: forfaitType,
          ),
        );
      }).toList(),
    );
  }
}

class _DetailCartItem extends StatelessWidget {
  final String forfaitType;
  final ItemCartModel forfait;
  const _DetailCartItem({required this.forfait, required this.forfaitType});
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 125,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Day: ${format.format(forfait.date)}",
                style: StylesUI.bodyStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/items/forfait.png", height: 75),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$forfaitType ${forfait.name}",
                        style: StylesUI.titleStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${forfait.price.toStringAsFixed(2)} €",
                        style: StylesUI.bodyStyle,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionButton(
                          child: const Text("+", style: StylesUI.bodyStyle),
                          onPressed: () => {
                                context
                                    .read<CartProvider>()
                                    .addQuantityToItem(forfait)
                              }),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        forfait.quantity.toString(),
                        style: StylesUI.bodyStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ActionButton(
                          child: const Icon(
                            Icons.delete,
                            size: 20,
                          ),
                          onPressed: () => {
                                context
                                    .read<CartProvider>()
                                    .removeQuantityToItem(forfait)
                              }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

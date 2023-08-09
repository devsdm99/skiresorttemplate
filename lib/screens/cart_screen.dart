import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/providers/providers.dart';
import 'package:skiresorttemplate/ui/styles.ui.dart';

import '../helpers/helpers.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

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
            child: CompleteOrderButton(
              onTap: () => {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const _PaymentCards())
              },
              totalToPay: cartProvider.total,
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
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            "${cartProvider.total.toStringAsFixed(2)} €",
            style: Theme.of(context).textTheme.labelMedium,
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
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            "${cartProvider.tax.toStringAsFixed(2)} €",
            style: Theme.of(context).textTheme.titleSmall,
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
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            "${cartProvider.subtotal.toStringAsFixed(2)} €",
            style: Theme.of(context).textTheme.titleSmall,
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "+ Add new card",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ClassHelper.cards.length,
            itemBuilder: (context, index) {
              final card = ClassHelper.cards[index];
              return _Card(card: card);
            },
          ),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final CreditCardModel card;
  const _Card({required this.card});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              ),
              Text(
                "**** **** **** ${card.cardNumber.substring(card.cardNumber.length - 5)}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "Expires ${DateFormat("MM/yy").format(card.expiryDate)}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                card.cardHolderName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
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
                style: Theme.of(context).textTheme.labelSmall,
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
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${forfait.price.toStringAsFixed(2)} €",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionButton(
                          child: Text("+",
                              style: Theme.of(context).textTheme.labelSmall),
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
                        style: Theme.of(context).textTheme.labelSmall,
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

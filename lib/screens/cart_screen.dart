import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/models/forfait_category_model.dart';
import 'package:skiresorttemplate/providers/providers.dart';
import 'package:skiresorttemplate/ui/styles.ui.dart';

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
      body: SingleChildScrollView(
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Subtotal:",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "${cartProvider.subtotal.toStringAsFixed(2)} €",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Total: ${cartProvider.total.toStringAsFixed(2)} €",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("CHECKOUT"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderDetails extends StatelessWidget {
  const _OrderDetails({
    super.key,
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
            color: Colors.red,
            child: const Icon(
              Icons.delete_forever,
              color: Colors.white,
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
                  const Text(
                    "YOUR \nFORFAIT \nIMAGE OR ICON\n HERE",
                    style: TextStyle(color: Colors.black),
                  ),
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
                        "${forfait.price?.toStringAsFixed(2)} €",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddButton(
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
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RemoveButton(
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

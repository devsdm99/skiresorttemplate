import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/helpers/helpers.dart';
import 'package:skiresorttemplate/providers/shop_provider.dart';

class BuyForfaitScreen extends StatelessWidget {
  static const routeName = "BuyForfaitScreen";
  const BuyForfaitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForfaitProvider forfaitProvider =
        Provider.of<ForfaitProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
          ),
          child: Column(
            children: [
              Text("Selecione una fecha de uso:",
                  style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Selector<ForfaitProvider, DateTime>(
                  selector: (_, provider) => provider.forfaitDate,
                  builder: (context, fecha, child) {
                    return TextFormField(
                      key: Key(fecha.toString()),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.normal, color: Colors.black),
                      initialValue:
                          DateFormat('dd-MM-yyyy').format(fecha).toString(),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                      ),
                      readOnly: true, // when true user cannot edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        forfaitProvider.forfaitDate =
                            pickedDate ?? DateTime.now();
                      },
                    );
                  },
                ),
              ),
              ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                    collapsed: const Icon(Icons.arrow_downward),
                    expanded: const _ForfaitContainer(),
                    theme: ExpandableThemeData(
                      iconColor: Colors.black,
                      expandIcon: Icons.arrow_downward,
                      collapseIcon: Icons.arrow_upward,
                    ),
                    builder: (context, collapsed, expanded) {
                      return Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForfaitContainer extends StatelessWidget {
  const _ForfaitContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForfaitProvider forfaitProvider =
        Provider.of<ForfaitProvider>(context, listen: true);
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Compra de forfait de dia",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "Forfaits: ${forfaitProvider.forfaits}",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (forfaitProvider.forfaits > 0) {
                    forfaitProvider.forfaits -= 1;
                  }
                },
                child: Ink(
                  child: const _ActionButton(
                    text: "-",
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (forfaitProvider.forfaits * PricesHelper.forfaitPrice)
                          .toStringAsFixed(2),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "€",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  forfaitProvider.forfaits += 1;
                },
                child: Ink(
                  child: const _ActionButton(
                    text: "+",
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(60))),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

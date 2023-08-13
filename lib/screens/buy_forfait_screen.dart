import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/providers/providers.dart';
import 'package:skiresorttemplate/ui/styles_ui.dart';
import 'package:skiresorttemplate/widgets/widgets.dart';

class BuyForfaitScreen extends StatelessWidget {
  static const routeName = "BuyForfaitScreen";
  const BuyForfaitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForfaitProvider forfaitProvider =
        Provider.of<ForfaitProvider>(context, listen: true);
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarWidget(
          isMainScreen: false,
          showCart: false,
          title: "Buy Forfait",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const _Title(),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: _CalendarPicker(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const _ForfaitsPanel(),
                const Divider(
                  height: 30,
                  color: Colors.black,
                ),
                Text(
                  "1 Day Forfait Prices",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const _YearsCategory(
                  category: "ADULT: ",
                  rangeYears: "16-64 Years",
                ),
                const SizedBox(
                  height: 10,
                ),
                const _YearsCategory(
                  category: "JUNIOR: ",
                  rangeYears: "12-17 Years",
                ),
                const SizedBox(
                  height: 10,
                ),
                const _YearsCategory(
                  category: "CHILD: ",
                  rangeYears: "6-11 Years",
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                    "DIRECT SALES IN THE TICKET OFFICE: obligatory provide an I.D.",
                    style: StylesUI.heading),
                const SizedBox(
                  height: 30,
                ),
                const _YearsCategory(
                  category: "CHILD BABY < 6 Years: ",
                  rangeYears: "Free",
                ),
                const SizedBox(
                  height: 10,
                ),
                const _YearsCategory(
                  category: "SENIOR 65-74 Years: ",
                  rangeYears: "Discount of over 30%",
                ),
                const SizedBox(
                  height: 10,
                ),
                const _YearsCategory(
                  category: "SENIOR GOLD > 75 : ",
                  rangeYears: "Free",
                ),
                const SizedBox(
                  height: 70,
                ),
                AddToCartButton(
                  onTap: () {
                    cartProvider.addForfaitsToCart(
                        forfaitProvider.adultForfaits,
                        forfaitProvider.juniorForfaits,
                        forfaitProvider.childForfaits,
                        forfaitProvider.forfaitDate);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _YearsCategory extends StatelessWidget {
  const _YearsCategory(
      {Key? key, required this.rangeYears, required this.category})
      : super(key: key);
  final String category;
  final String rangeYears;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(category, style: StylesUI.heading),
        Flexible(
          child: Text(
              overflow: TextOverflow.ellipsis,
              rangeYears,
              style: StylesUI.bodyStyle),
        ),
      ],
    );
  }
}

class _ForfaitsPanel extends StatelessWidget {
  const _ForfaitsPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForfaitProvider forfaitProvider =
        Provider.of<ForfaitProvider>(context, listen: true);
    return ExpandableNotifier(
      initialExpanded: true,
      child: ScrollOnExpand(
        theme: const ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapBodyToCollapse: true,
        ),
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              (forfaitProvider.totalForfaits <= 0)
                  ? "Add some ski passes"
                  : "${forfaitProvider.totalForfaits} Pax",
              style: StylesUI.heading,
            ),
          ),
          collapsed: Container(),
          expanded: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                _ForfaitCategory(
                  title:
                      "1 Day Adult (${ForfaitProvider.adultForfaitPrice.toStringAsFixed(2)}€)",
                  subtitle: "18-64 years",
                  numForfaits: forfaitProvider.adultForfaits,
                  onLessTap: () {
                    if (forfaitProvider.adultForfaits > 0) {
                      forfaitProvider.adultForfaits -= 1;
                    }
                  },
                  onPlusTap: () {
                    forfaitProvider.adultForfaits += 1;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                _ForfaitCategory(
                  title:
                      "1 Day Junior (${ForfaitProvider.juniorForfaitPrice.toStringAsFixed(2)}€)",
                  subtitle: "12-17 years",
                  numForfaits: forfaitProvider.juniorForfaits,
                  onLessTap: () {
                    if (forfaitProvider.juniorForfaits > 0) {
                      forfaitProvider.juniorForfaits -= 1;
                    }
                  },
                  onPlusTap: () {
                    forfaitProvider.juniorForfaits += 1;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                _ForfaitCategory(
                  title:
                      "1 Day Child (${ForfaitProvider.childForfaitPrice.toStringAsFixed(2)}€)",
                  subtitle: "6-11 years",
                  numForfaits: forfaitProvider.childForfaits,
                  onLessTap: () {
                    if (forfaitProvider.childForfaits > 0) {
                      forfaitProvider.childForfaits -= 1;
                    }
                  },
                  onPlusTap: () {
                    forfaitProvider.childForfaits += 1;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ForfaitCategory extends StatelessWidget {
  const _ForfaitCategory(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.numForfaits,
      required this.onLessTap,
      required this.onPlusTap})
      : super(key: key);
  final String title;
  final String subtitle;
  final int numForfaits;
  final VoidCallback onLessTap;
  final VoidCallback onPlusTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: StylesUI.bodyStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(subtitle, style: StylesUI.subtitle)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionButton(
              onPressed: onLessTap,
              child: const Text("-", style: StylesUI.bodyStyle),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              numForfaits.toString(),
              style: StylesUI.bodyStyle,
            ),
            const SizedBox(
              width: 10,
            ),
            ActionButton(
              onPressed: onPlusTap,
              child: const Text("+", style: StylesUI.bodyStyle),
            )
          ],
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Select a date", style: StylesUI.titleStyle),
    );
  }
}

class _CalendarPicker extends StatelessWidget {
  const _CalendarPicker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ForfaitProvider forfaitProvider =
        Provider.of<ForfaitProvider>(context, listen: false);
    return Selector<ForfaitProvider, DateTime>(
      selector: (_, provider) => provider.forfaitDate,
      builder: (context, fecha, child) {
        return TextFormField(
          key: Key(fecha.toString()),
          style: StylesUI.headlineStyle,
          initialValue: DateFormat('dd-MM-yyyy').format(fecha).toString(),
          decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today), //icon of text field
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              forfaitProvider.forfaitDate = pickedDate;
            }
          },
        );
      },
    );
  }
}

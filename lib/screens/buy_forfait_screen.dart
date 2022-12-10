import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/providers/forfait_provider.dart';
import 'package:skiresorttemplate/theme/skiresort_theme.dart';

class BuyForfaitScreen extends StatelessWidget {
  static const routeName = "BuyForfaitScreen";
  const BuyForfaitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).buttonTheme.colorScheme?.secondary,
            ),
          ),
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
                Text(
                  "TYPES:",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontWeight: FontWeight.normal),
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
                  rangeYears: "12-17S Years",
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
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontWeight: FontWeight.normal),
                ),
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
      {Key? key, required this.category, required this.rangeYears})
      : super(key: key);
  final String category;
  final String rangeYears;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(category, style: Theme.of(context).textTheme.labelSmall),
        Flexible(
          child: Text(
            overflow: TextOverflow.ellipsis,
            rangeYears,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.normal),
          ),
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
                  ? "Selecciona los forfaits"
                  : "${forfaitProvider.totalForfaits} Pasajeros",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          collapsed: Container(),
          expanded: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
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
                  title: "1 Day Adult (52.50€)",
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
                  title: "1 Day Junior",
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
                  title: "1 Day Child",
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
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontWeight: FontWeight.normal),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onLessTap,
              child: Container(
                color: Colors.yellow.shade700,
                height: 30,
                width: 30,
                child: Center(
                  child:
                      Text("-", style: Theme.of(context).textTheme.labelSmall),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              numForfaits.toString(),
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: onPlusTap,
              child: Container(
                color: Colors.yellow.shade700,
                height: 30,
                width: 30,
                child: Center(
                  child:
                      Text("+", style: Theme.of(context).textTheme.labelSmall),
                ),
              ),
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
      child: Text("Selecione la fecha",
          style: Theme.of(context).textTheme.labelSmall),
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
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontWeight: FontWeight.normal, color: Colors.black),
          initialValue: DateFormat('dd-MM-yyyy').format(fecha).toString(),
          decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today), //icon of text field
          ),
          readOnly: true, // when true user cannot edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
              builder: (context, child) {
                return Theme(
                  data: SkiResortTheme.lightTheme,
                  child: child!,
                );
              },
            );

            forfaitProvider.forfaitDate = pickedDate ?? DateTime.now();
          },
        );
      },
    );
  }
}

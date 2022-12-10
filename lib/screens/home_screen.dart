import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skiresorttemplate/models/models.dart';
import 'package:skiresorttemplate/providers/home_provider.dart';
import 'package:skiresorttemplate/ui/ui.dart';
import 'package:skiresorttemplate/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: PageView.builder(
              onPageChanged: ((value) {}),
              itemCount: homeProvider.statistics.length,
              itemBuilder: (context, index) {
                TimeStatisticsModel model = homeProvider.statistics[index];
                return _SectorStatistics(model: model);
              },
            ),
          ),
          //const _SectorStatistics(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Webcams",
              style: StylesUI.titleStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const _Webcams(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    MenuItemWidget(
                        iconData: Icons.cloudy_snowing,
                        text: "Parte de la estación"),
                    MenuItemWidget(
                        iconData: Icons.health_and_safety,
                        text: "Medidas Sanitarias"),
                    MenuItemWidget(
                        iconData: Icons.map_sharp, text: "Mapa de pistas"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    BigMenuButtonWidget(
                        imgPath: "assets/home/forfaits.jpg", text: "FORFAITS"),
                    Spacer(),
                    MenuItemWidget(
                        iconData: Icons.payment_rounded,
                        text: "Compra forfait de dia")
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    BigMenuButtonWidget(
                        imgPath: "assets/home/teleferico.jpg",
                        text: "VENTAJAS"),
                    Spacer(),
                    MenuItemWidget(iconData: Icons.info, text: "Servicios")
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    BigMenuButtonWidget(
                        imgPath: "assets/home/restaurant.jpg",
                        text: "RESTAURANTE"),
                    Spacer(),
                    MenuItemWidget(iconData: Icons.restaurant, text: "Reservas")
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    BigMenuButtonWidget(
                        imgPath: "assets/home/moto.jpg", text: "ACTIVIDADES"),
                    Spacer(),
                    MenuItemWidget(
                        iconData: Icons.calendar_month_outlined,
                        text: "Eventos")
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Contacto",
                        style: StylesUI.homeTypeStyle,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Redes sociales",
                        style: StylesUI.homeTypeStyle,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.computer_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Web",
                        style: StylesUI.homeTypeStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
          /*TabPageSelector(
            controller: _tabController,
            color: Colors.white,
            borderStyle: BorderStyle.none,
            indicatorSize: 10,
          ),*/
        ],
      ),
    );
  }
}

class _Webcams extends StatelessWidget {
  const _Webcams({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _WebcamWidget(
            path: "assets/webcams/webcam1.jpg",
          ),
          _WebcamWidget(
            path: "assets/webcams/webcam2.jpg",
          ),
          _WebcamWidget(
            path: "assets/webcams/webcam3.jpg",
          ),
          _WebcamWidget(
            path: "assets/webcams/webcam1.jpg",
          ),
        ],
      ),
    );
  }
}

class _WebcamWidget extends StatelessWidget {
  const _WebcamWidget({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 200,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Image.asset(
            path,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class _SectorStatistics extends StatelessWidget {
  const _SectorStatistics({Key? key, required this.model}) : super(key: key);
  final TimeStatisticsModel model;
  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("El tiempo - ${model.sector}",
                style: StylesUI.homeTypeStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    homeProvider.icons[model.weather],
                    color: Colors.white,
                  ),
                  Text(
                    "${model.weather}",
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
              Column(
                children: [
                  Text("${model.averageTemp}°C",
                      style: StylesUI.homeTypeStyle
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(
                    "${model.maxTemp}° | ${model.minTemp}°",
                    style: StylesUI.homeTypeStyle,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "${model.percentagePrep}%",
                    style: StylesUI.homeTypeStyle
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Precipitación",
                    style: StylesUI.homeTypeStyle,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "${model.windSpeed}kph",
                    style: StylesUI.homeTypeStyle
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Viento",
                    style: StylesUI.homeTypeStyle,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _WelcomeWidget extends StatelessWidget {
  const _WelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text("¡Welcome Admin!", style: StylesUI.titleStyle),
    );
  }
}

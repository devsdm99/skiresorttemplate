import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skiresorttemplate/screens/screens.dart';
import 'package:skiresorttemplate/ui/ui.dart';
import 'package:skiresorttemplate/widgets/widgets.dart';
import '../providers/providers.dart';

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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text("Welcome",
                style: StylesUI.titleStyle
                    .copyWith(fontSize: 35, color: StylesUI.primaryColor)),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 75,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/items/snowboard.png",
                            scale: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "10% DISCOUNT",
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                                style: StylesUI.titleStyle.copyWith(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const Text(
                                "Snowboard products",
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                                style: StylesUI.bodyStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const _WeatherForecast(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const BigMenuButtonWidget(
                        imgPath: "assets/home/forfaits.jpg",
                        text: "SKI PASSES"),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, BuyForfaitScreen.routeName);
                      },
                      child: const MenuItemWidget(
                          iconData: Icons.payment_rounded,
                          text: "Buy day pass"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    BigMenuButtonWidget(
                        imgPath: "assets/home/teleferico.jpg",
                        text: "ADVANTAGES"),
                    Spacer(),
                    MenuItemWidget(iconData: Icons.info, text: "Servicios")
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    BigMenuButtonWidget(
                        imgPath: "assets/home/restaurant.jpg",
                        text: "RESTAURANTE"),
                    Spacer(),
                    MenuItemWidget(
                        iconData: Icons.restaurant, text: "Reservations")
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    BigMenuButtonWidget(
                        imgPath: "assets/home/moto.jpg", text: "ACTIVITIES"),
                    Spacer(),
                    MenuItemWidget(
                        iconData: Icons.calendar_month_outlined, text: "Events")
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

class _WeatherForecast extends StatelessWidget {
  const _WeatherForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Weather forecast", style: StylesUI.titleStyle),
          Text(HomeProvider.statistics.weather.toUpperCase(),
              style: StylesUI.bodyStyle),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Max",
                    style: StylesUI.headlineStyle,
                  ),
                  Text("${HomeProvider.statistics.maxTemp}ºC",
                      style: StylesUI.titleStyle.copyWith(
                          color: StylesUI.primaryColor, fontSize: 25)),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Min",
                    style: StylesUI.headlineStyle,
                  ),
                  Text("${HomeProvider.statistics.minTemp}ºC",
                      style: StylesUI.titleStyle.copyWith(
                          color: StylesUI.primaryColor, fontSize: 25)),
                ],
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.wb_sunny_outlined,
                  color: StylesUI.primaryColor,
                  size: 60,
                ),
              ),
              const SizedBox(
                width: 30,
              )
            ],
          )
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

import 'package:covid19_tracker_app/Screens/Countries_States.dart';
import 'package:covid19_tracker_app/Services/World_States_Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Models/World_State_Model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final AnimationController controllerr = AnimationController(
      duration: const Duration(milliseconds: 3000), vsync: this)
    ..repeat();

  final colorsList = <Color>[
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          FutureBuilder(
              future: WorldData.getCovidData(),
              builder: (context, AsyncSnapshot<WorldWideStates> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: {
                          'Total Cases':
                              double.parse(snapshot.data!.cases.toString()),
                          'Total Deaths':
                              double.parse(snapshot.data!.deaths.toString()),
                          'Recovered':
                              double.parse(snapshot.data!.recovered.toString()),
                        },
                        chartRadius: 190,
                        chartType: ChartType.ring,
                        colorList: colorsList,
                        animationDuration: const Duration(milliseconds: 1500),
                        initialAngleInDegree: 0,
                        legendOptions: const LegendOptions(
                            legendTextStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                            legendPosition: LegendPosition.left),
                        emptyColor: Colors.cyan,
                        chartLegendSpacing: 53,
                        ringStrokeWidth: 29,
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Card(
                              color: Colors.grey[200],
                              child: Column(
                                children: [
                                  CardData(
                                    title: 'Total Cases',
                                    data: snapshot.data!.cases.toString(),
                                  ),
                                  CardData(
                                      title: 'Total Deaths',
                                      data: snapshot.data!.deaths.toString()),
                                  CardData(
                                      title: 'Total Recovered',
                                      data:
                                          snapshot.data!.recovered.toString()),
                                  CardData(
                                      title: 'Todays Cases',
                                      data:
                                          snapshot.data!.todayCases.toString()),
                                  CardData(
                                      title: 'Todays Deaths',
                                      data: snapshot.data!.todayDeaths
                                          .toString()),
                                  CardData(
                                      title: 'Todays Recovered',
                                      data: snapshot.data!.todayRecovered
                                          .toString()),
                                  CardData(
                                      title: 'Critical',
                                      data: snapshot.data!.critical.toString()),
                                  CardData(
                                      title: 'Total Tests',
                                      data: snapshot.data!.tests.toString()),
                                ],
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: ((context) =>
                                        const CountriesList())));
                              },
                              child: Container(
                                height: 53,
                                width: 350,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  'Track Countries',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return SpinKitSpinningLines(
                    color: Colors.black,
                    duration: const Duration(seconds: 3),
                    size: 60,
                    controller: controllerr,
                  );
                }
              }),
        ],
      ),
    ));
  }
}

TextStyle fontstyle = const TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

class CardData extends StatelessWidget {
  String title, data;
  CardData({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 13),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: fontstyle,
              ),
              Text(
                data,
                style: fontstyle,
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}

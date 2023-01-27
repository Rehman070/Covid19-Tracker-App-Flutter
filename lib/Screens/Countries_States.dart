import 'package:covid19_tracker_app/Screens/Show_specific_Country.dart';
import 'package:covid19_tracker_app/Services/World_States_Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WorldData worldData = WorldData();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30),
            )),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 15),
            child: TextField(
              controller: controller,
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                  hintText: 'Search Country by Name',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: worldData.getCountriesData(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String countryName =
                              snapshot.data![index]['country'].toString();

                          if (controller.text.isEmpty) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => SpecificCountry(
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          name: snapshot.data![index]
                                              ['country'],
                                          totalCases: snapshot.data![index]
                                              ['cases'],
                                          totalRecovered: snapshot.data![index]
                                              ['recovered'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          test: snapshot.data![index]['tests'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                        )));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(snapshot
                                      .data![index]['countryInfo']['flag']
                                      .toString()),
                                ),
                                title: Text(snapshot.data![index]['country']
                                    .toString()),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                trailing: Text(snapshot.data![index]
                                        ['continent']
                                    .toString()),
                              ),
                            );
                          } else if (countryName
                              .toLowerCase()
                              .contains(controller.text)) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => SpecificCountry(
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          name: snapshot.data![index]
                                              ['country'],
                                          totalCases: snapshot.data![index]
                                              ['cases'],
                                          totalRecovered: snapshot.data![index]
                                              ['recovered'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          test: snapshot.data![index]['tests'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                        )));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(snapshot
                                      .data![index]['countryInfo']['flag']
                                      .toString()),
                                ),
                                title: Text(snapshot.data![index]['country']
                                    .toString()),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                trailing: Text(snapshot.data![index]
                                        ['continent']
                                    .toString()),
                              ),
                            );
                          } else if (countryName
                              .toUpperCase()
                              .contains(controller.text)) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => SpecificCountry(
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          name: snapshot.data![index]
                                              ['country'],
                                          totalCases: snapshot.data![index]
                                              ['cases'],
                                          totalRecovered: snapshot.data![index]
                                              ['recovered'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          test: snapshot.data![index]['tests'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                        )));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(snapshot
                                      .data![index]['countryInfo']['flag']
                                      .toString()),
                                ),
                                title: Text(snapshot.data![index]['country']
                                    .toString()),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                trailing: Text(snapshot.data![index]
                                        ['continent']
                                    .toString()),
                              ),
                            );
                          } else if (countryName == controller.text) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => SpecificCountry(
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          name: snapshot.data![index]
                                              ['country'],
                                          totalCases: snapshot.data![index]
                                              ['cases'],
                                          totalRecovered: snapshot.data![index]
                                              ['recovered'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          test: snapshot.data![index]['tests'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                        )));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(snapshot
                                      .data![index]['countryInfo']['flag']
                                      .toString()),
                                ),
                                title: Text(snapshot.data![index]['country']
                                    .toString()),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                trailing: Text(snapshot.data![index]
                                        ['continent']
                                    .toString()),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        });
                  } else {
                    return const Center(
                        child: SpinKitSpinningLines(
                      color: Colors.black,
                      duration: Duration(seconds: 3),
                      size: 60,
                    ));
                  }
                }),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';

class SpecificCountry extends StatefulWidget {
  String image;
  String name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  SpecificCountry({
    super.key,
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<SpecificCountry> createState() => _SpecificCountryState();
}

class _SpecificCountryState extends State<SpecificCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
            )),
        centerTitle: true,
      
      ),
     
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067,
                      left: 3,
                      right: 3),
                  child: Card(
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        ReusableRow(
                          title: 'Cases',
                          value: widget.totalCases.toString(),
                        ),
                        ReusableRow(
                          title: 'Recovered',
                          value: widget.totalRecovered.toString(),
                        ),
                        ReusableRow(
                          title: 'Death',
                          value: widget.totalDeaths.toString(),
                        ),
                        ReusableRow(
                          title: 'Critical',
                          value: widget.critical.toString(),
                        ),
                        ReusableRow(
                          title: 'Today Recovered',
                          value: widget.totalRecovered.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

TextStyle fontstyle = const TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

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
                value,
                style: fontstyle,
              )
            ],
          ),
          const SizedBox(
            height: 5,
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

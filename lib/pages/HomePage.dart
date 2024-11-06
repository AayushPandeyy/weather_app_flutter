import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/constants/ColorsToUse.dart';
import 'package:weather_app_flutter/services/LocationService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocationService locationService = LocationService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: locationService.getCityName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                  backgroundColor: ColorsToUse().primaryYellow,
                  body: const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  )));
            }
            return Scaffold(
              backgroundColor: ColorsToUse().primaryYellow,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  snapshot.data!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                    )),
              ),
              body: Center(
                child: SizedBox(
                  height: double.infinity,
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            // height: 30,
                            // width: MediaQuery.sizeOf(context).width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: IntrinsicWidth(
                                child: Center(
                                  child: Text(
                                    DateFormat.yMMMMEEEEd()
                                        .format(DateTime.now()),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: Text(
                            "Sunny",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "30\u00B0",
                            style:
                                TextStyle(color: Colors.black, fontSize: 150),
                          ),
                        ),
                        WindDetails(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Text("Weekly Forecast",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Spacer(),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 130,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              DailyForecastTile(34, "5 Jan", context),
                              DailyForecastTile(34, "5 Jan", context),
                              DailyForecastTile(34, "5 Jan", context),
                              DailyForecastTile(34, "5 Jan", context),
                              DailyForecastTile(34, "5 Jan", context),
                              DailyForecastTile(34, "5 Jan", context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

Widget WindDetails(BuildContext context) {
  return Center(
    child: Container(
      height: 150,
      // width: MediaQuery.sizeOf(context).width * 0.8,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.waves,
                  size: 40,
                  color: ColorsToUse().primaryYellow,
                ),
                Text(
                  "1km/h",
                  style: TextStyle(
                      color: ColorsToUse().primaryYellow, fontSize: 20),
                ),
                Text(
                  "Wind",
                  style: TextStyle(
                      color: ColorsToUse().primaryYellow, fontSize: 15),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.water_drop,
                  size: 40,
                  color: ColorsToUse().primaryYellow,
                ),
                Text(
                  "62%",
                  style: TextStyle(
                      color: ColorsToUse().primaryYellow, fontSize: 20),
                ),
                Text(
                  "Humidity",
                  style: TextStyle(
                      color: ColorsToUse().primaryYellow, fontSize: 15),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_red_eye,
                  size: 40,
                  color: ColorsToUse().primaryYellow,
                ),
                Text(
                  "0.8km",
                  style: TextStyle(
                      color: ColorsToUse().primaryYellow, fontSize: 20),
                ),
                Text(
                  "Visibility",
                  style: TextStyle(
                      color: ColorsToUse().primaryYellow, fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget DailyForecastTile(int degree, String date, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 150,
      width: MediaQuery.sizeOf(context).width * 0.2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$degree\u00B0",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.water_drop),
          Text(
            date,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

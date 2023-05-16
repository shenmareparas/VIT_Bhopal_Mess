import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings.dart';
import 'map.dart';

String getMealTime(DateTime now) {
  int hour = now.hour;
  if (hour < 9) {
    return 'Breakfast';
  } else if (hour < 15) {
    return 'Lunch';
  } else if (hour < 18) {
    return 'Snacks';
  } else if (hour < 21) {
    return 'Dinner';
  } else {
    return "Breakfast";
  }
}

Map getMess(int selectedMess) {
  switch (selectedMess) {
    case 1:
      return mess_1;
    case 2:
      return mess_2;
    case 3:
      return mess_3;
    default:
      return mess_1;
  }
}

var days = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];

var meal = ["Breakfast", "Lunch", "Snacks", "Dinner"];

DateTime now = DateTime.now();
String mealTime = getMealTime(now);
String formattedDate = DateFormat('EEEE').format(now);
String formattedTime = DateFormat('HH:mm').format(now);

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  void _resetValues() {
    setState(() {
      formattedDate = DateFormat('EEEE').format(DateTime.now());
      mealTime = getMealTime(DateTime.now());
    });
  }

  void readselectedMess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? selectedMess = prefs.getInt("selectedMess");
    if (selectedMess != null) {
      setState(() {
        selectedMess = savedselectedMess;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readselectedMess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Select Day',
                                textAlign: TextAlign.center),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: days.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () => {
                                          setState(() {
                                            formattedDate = days[index];
                                          }),
                                          Navigator.of(context).pop(),
                                        },
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(days[index],
                                                  style: const TextStyle(
                                                      fontSize: 18)),
                                            )),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Select Meal Time',
                                textAlign: TextAlign.center),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: meal.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () => {
                                          setState(() {
                                            mealTime = meal[index];
                                          }),
                                          Navigator.of(context).pop(),
                                        },
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(meal[index],
                                                  style: const TextStyle(
                                                      fontSize: 18)),
                                            )),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      mealTime,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: getMess(selectedMess)[formattedDate]
                                [mealTime]
                            ?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getMess(selectedMess)[formattedDate]![
                                        mealTime]![index]
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _resetValues,
                tooltip: 'Reset',
                child: const Icon(Icons.restart_alt),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

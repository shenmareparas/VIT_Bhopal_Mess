// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'settings.dart';
import 'map.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();

  static String getMealTime(DateTime now) {
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
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String mealTime = Upcoming.getMealTime(now);
    String formattedDate = DateFormat('EEEE').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);

    print("Day: $formattedDate");
    print("Time: $formattedTime");
    print(
        "Total items: ${getMess(selectedMess)[formattedDate][mealTime]?.length}");
    print("Mess: $selectedMess");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  var days = [
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday",
                    "Sunday"
                  ];
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Select Day',
                          textAlign: TextAlign.center, // Center align the text
                        ),
                        content: SizedBox(
                          width: double.maxFinite,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: days.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        formattedDate = days[index];
                                      }),
                                      Navigator.of(context).pop(),
                                      print(formattedDate),
                                    },
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(days[index])),
                                  ),
                                  const SizedBox(height: 18)
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
            Row(
              children: [
                Expanded(
                  child: FloatingActionButton(
                    heroTag: 'btn02',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Select Meal Time'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  GestureDetector(
                                    child: const Text('Breakfast'),
                                    onTap: () {
                                      setState(() {
                                        mealTime = 'Breakfast';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const SizedBox(height: 18),
                                  GestureDetector(
                                    child: const Text('Lunch'),
                                    onTap: () {
                                      setState(() {
                                        mealTime = 'Lunch';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const SizedBox(height: 18),
                                  GestureDetector(
                                    child: const Text('Snacks'),
                                    onTap: () {
                                      setState(() {
                                        mealTime = 'Snacks';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const SizedBox(height: 18),
                                  GestureDetector(
                                    child: const Text('Dinner'),
                                    onTap: () {
                                      setState(() {
                                        mealTime = 'Dinner';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      mealTime,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        getMess(selectedMess)[formattedDate][mealTime]?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getMess(selectedMess)[formattedDate]![mealTime]![
                                    index]
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
      ),
    );
  }

  Map getMess(int electedMess) {
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
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'settings.dart';
import 'map.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String mealTime = getMealTime(now);
    String formattedDate = DateFormat('EEEE').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);

    print("Day: $formattedDate");
    print("Time: $formattedTime");
    print("Total items: ${mess1[formattedDate]![mealTime]?.length}");
    print("Mess: $selectedMess");

    if (mess1[formattedDate] != null &&
        mess1[formattedDate]![mealTime] != null) {
      print(mess1[formattedDate]![mealTime]);
    } else {
      print('No meal found for $formattedDate at $mealTime');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: const TextStyle(color: Colors.black, fontSize: 30),
            ),
            Text(
              getMealTime(now).toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                // fontWeight: FontWeight.bold,
                // shadows: [
                //   Shadow(
                //     blurRadius: 2,
                //     color: Colors.black,
                //     offset: Offset(1, 1),
                //   ),
                // ],
              ),
            ),
            Text(
              formattedTime,
              style: const TextStyle(color: Colors.black, fontSize: 30),
            ),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mess1[formattedDate]![mealTime]?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    mess1[formattedDate]![mealTime]![index].toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      // fontWeight: FontWeight.bold,
                      // shadows: [
                      //   Shadow(
                      //     blurRadius: 2,
                      //     color: Colors.black,
                      //     offset: Offset(1, 1),
                      //   ),
                      // ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // static String getMess() {
  //   if (selectedMess == 1) {
  //     return 'mess1';
  //   } else if (selectedMess == 2) {
  //     return 'mess2';
  //   } else {
  //     return "mess3";
  //   }
  // }

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

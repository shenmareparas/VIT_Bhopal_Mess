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

    // print("Day: $formattedDate");
    // print("Time: $formattedTime");
    // print("Total items: ${getMess[formattedDate]![mealTime]?.length}");
    // print("Mess: $selectedMess");

    // if (getMess[formattedDate] != null &&
    //     getMess[formattedDate]![mealTime] != null) {
    //   print(getMess[formattedDate]![mealTime]);
    // } else {
    //   print('No meal found for $formattedDate at $mealTime');
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          formattedDate,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          getMealTime(now).toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Card(
            //         elevation: 4,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(16.0),
            //           child: Text(
            //             formattedTime,
            //             style: const TextStyle(
            //               color: Colors.black,
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    getMess(selectedMess)[formattedDate][mealTime]?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        getMess(selectedMess)[formattedDate]![mealTime]![index]
                            .toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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

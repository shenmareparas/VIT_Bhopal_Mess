import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../parsers/upcomming_menu_paser.dart';
import 'settings.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => UpcomingState();
}

class UpcomingState extends State<Upcoming> {
  void resetValues() {
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
        selectedMess = selectedMess;
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
                                        borderRadius: BorderRadius.circular(15),
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
                        side: const BorderSide(
                            width: 2, color: Color(0xFFD0EE82)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      getformattedDate(now),
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
                                        borderRadius: BorderRadius.circular(15),
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
                        side: const BorderSide(
                            width: 2, color: Color(0xFFD0EE82)),
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
                        shrinkWrap: true,
                        itemCount: getMess(selectedMess)[getformattedDate(now)]
                                [mealTime]
                            ?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getMess(selectedMess)[getformattedDate(now)]![
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
                elevation: 5,
                onPressed: resetValues,
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

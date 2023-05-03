import 'package:flutter/material.dart';

// Step 1: Define your data model
class MyData {
  final String name;
  final DateTime time;

  MyData({required this.name, required this.time});
}

// Step 2: Build your UI
class MyHomePage extends StatelessWidget {
  final Map<String, List<MyData>> allData;

  const MyHomePage({super.key, required this.allData});

  @override
  Widget build(BuildContext context) {
    // Step 3: Add time range logic
    final currentTime = DateTime.now();
    final weekday = _getWeekdayString(currentTime.weekday);
    final timeRanges = allData[weekday] ?? [];

    //final filteredData =
    //    timeRanges.where((data) => data.time.isBefore(currentTime)).toList();
    final filteredData = timeRanges;

    // Step 5: Display filtered data
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
            'VIT Bhopal Mess',
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.black),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(filteredData[index].name),
          );
        },
      ),
    );
  }

  // Helper method to convert weekday number to string
  String _getWeekdayString(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
}

// Create some sample data
final Map<String, List<MyData>> allData = {
  'Monday': [
    MyData(name: 'Item 1', time: DateTime(2023, 5, 1, 10, 0)),
    MyData(name: 'Item 2', time: DateTime(2023, 5, 1, 15, 0)),
  ],
  'Tuesday': [
    MyData(name: 'Item 3', time: DateTime(2023, 5, 2, 12, 0)),
  ],
  'Wednesday': [
    MyData(name: 'Item 4', time: DateTime(2023, 5, 3, 11, 0)),
  ],
  'Thursday': [
    MyData(name: 'Breakfast', time: DateTime(2023, 5, 4, 14, 0)),
  ],
  'Friday': [
    MyData(name: 'Item 6', time: DateTime(2023, 5, 5, 14, 0)),
  ],
  'Saturday': [
    MyData(name: 'Item 7', time: DateTime(2023, 5, 6, 11, 0)),
  ],
  'Sunday': [
    MyData(name: 'Item 8', time: DateTime(2023, 5, 7, 13, 0)),
  ],
};

// Display the home page
// Step 6: Create a main method to run the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(allData: allData),
    );
  }
}

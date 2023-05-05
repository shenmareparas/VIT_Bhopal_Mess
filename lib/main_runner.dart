// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainRunner extends StatelessWidget {
  const MainRunner({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String mealTime = getMealTime(now);
    String formattedDate = DateFormat('EEEE').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);

    print(formattedDate);
    print(formattedTime);

    if (days[formattedDate] != null && days[formattedDate]![mealTime] != null) {
      print(days[formattedDate]![mealTime]);
    } else {
      print('No meal found for $formattedDate at $mealTime');
    }

    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
            'VIT Bhopal Mess',
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.black),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formattedDate,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
          Text(
            formattedTime,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
          Text(
            days[formattedDate]![mealTime].toString(),
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }

  static const Map<String, Map<String, String>> days = {
    'Monday': {
      'Breakfast': 'Toast',
      'Lunch': 'Hamburger',
      'Dinner': 'Spaghetti'
    },
    'Tuesday': {
      'Breakfast': 'Cereal',
      'Lunch': 'Turkey sandwich',
      'Dinner': 'Meatloaf'
    },
    'Wednesday': {
      'Breakfast': 'Oatmeal',
      'Lunch': 'Grilled cheese',
      'Dinner': 'Roast beef'
    },
    'Thursday': {
      'Breakfast': 'Pancakes',
      'Lunch': 'BLT',
      'Dinner': 'Chicken alfredo'
    },
    'Friday': {
      'Breakfast': 'Bagel',
      'Lunch': 'Pizza',
      'Dinner': 'Fish and chips'
    },
    'Saturday': {
      'Breakfast': 'Waffles',
      'Lunch': 'French dip',
      'Dinner': 'Tacos'
    },
    'Sunday': {
      'Breakfast': 'Eggs benedict',
      'Lunch': 'Philly cheesesteak',
      'Dinner': 'Pot roast'
    },
  };

  static String getMealTime(DateTime now) {
    int hour = now.hour;
    if (hour < 10) {
      return 'Breakfast';
    } else if (hour < 15) {
      return 'Lunch';
    } else {
      return 'Dinner';
    }
  }
}

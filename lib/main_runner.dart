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
            getMealTime(now).toString(),
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
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

  static const Map<String, Map<String, List<String>>> days = {
    'Monday': {
      'Breakfast': [
        "Idly, Midhu Vada",
        "Chutney, Sambar",
        "Banana/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      'Lunch': [
        'Salad',
        'Roti',
        "Rajma Gharwala",
        "Jeera Rice",
        "Aloo Pepper Fry",
        "Rice",
        "Lemon Rice",
        "Koottu",
        "Rasam",
        "Juice"
      ],
      'Snacks': ["Vada Pav", "Tea, Coffee, Milk"],
      'Dinner': [
        "Roti",
        "Kashmiri Pulao",
        "Egg Bhurji Masala",
        "Plain Dal",
        "Rice",
        "Rasam",
        "Pickle"
      ],
    },
    'Tuesday': {
      'Breakfast': [
        'Veg Paratha',
        'Veg Sabji',
        "Banava/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      'Lunch': [
        'Salad',
        'Poori',
        "Chana Masala",
        "Plain Rice",
        "Dal Tadka",
        "Sambar",
        "Rasam",
        "Carrot Beans Poriyal",
        "Curd"
      ],
      'Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
      'Dinner': [
        "Roti",
        "Kuska",
        "Aloo Meal Maker Sabji",
        "Masala Dal",
        "Rasam",
        "Pickle",
        "Halwa"
      ],
    },
    'Wednesday': {
      'Breakfast': [
        'Veg Paratha',
        'Veg Sabji',
        "Banava/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      'Lunch': [
        'Salad',
        'Poori',
        "Chana Masala",
        "Plain Rice",
        "Dal Tadka",
        "Sambar",
        "Rasam",
        "Carrot Beans Poriyal",
        "Curd"
      ],
      'Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
      'Dinner': [
        "Roti",
        "Kuska",
        "Aloo Meal Maker Sabji",
        "Masala Dal",
        "Rasam",
        "Pickle",
        "Halwa"
      ],
    },
    'Thursday': {
      'Breakfast': [
        'Veg Paratha',
        'Veg Sabji',
        "Banava/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      'Lunch': [
        'Salad',
        'Poori',
        "Chana Masala",
        "Plain Rice",
        "Dal Tadka",
        "Sambar",
        "Rasam",
        "Carrot Beans Poriyal",
        "Curd"
      ],
      'Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
      'Dinner': [
        "Roti",
        "Kuska",
        "Aloo Meal Maker Sabji",
        "Masala Dal",
        "Rasam",
        "Pickle",
        "Halwa"
      ],
    },
    'Friday': {
      'Breakfast': [
        'Veg Paratha',
        'Veg Sabji',
        "Banava/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      'Lunch': [
        'Salad',
        'Poori',
        "Chana Masala",
        "Plain Rice",
        "Dal Tadka",
        "Sambar",
        "Rasam",
        "Carrot Beans Poriyal",
        "Curd"
      ],
      'Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
      'Dinner': [
        "Roti",
        "Kuska",
        "Aloo Meal Maker Sabji",
        "Masala Dal",
        "Rasam",
        "Pickle",
        "Halwa"
      ],
    },
    'Saturday': {
      'Breakfast': [
        'Veg Paratha',
        'Veg Sabji',
        "Banava/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      'Lunch': [
        'Salad',
        'Poori',
        "Chana Masala",
        "Plain Rice",
        "Dal Tadka",
        "Sambar",
        "Rasam",
        "Carrot Beans Poriyal",
        "Curd"
      ],
      'Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
      'Dinner': [
        "Roti",
        "Kuska",
        "Aloo Meal Maker Sabji",
        "Masala Dal",
        "Rasam",
        "Pickle",
        "Halwa"
      ],
    },
    'Sunday': {
      'Breakfast': [
        'Veg Paratha',
        'Veg Sabji',
        "Banava/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      'Lunch': [
        'Salad',
        'Poori',
        "Chana Masala",
        "Plain Rice",
        "Dal Tadka",
        "Sambar",
        "Rasam",
        "Carrot Beans Poriyal",
        "Curd"
      ],
      'Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
      'Dinner': [
        "Roti",
        "Kuska",
        "Aloo Meal Maker Sabji",
        "Masala Dal",
        "Rasam",
        "Pickle",
        "Halwa"
      ],
    },
  };

  static String getMealTime(DateTime now) {
    int hour = now.hour;
    if (hour < 9) {
      return 'Breakfast';
    } else if (hour < 15) {
      return 'Lunch';
    } else if (hour < 17) {
      return 'Snacks';
    } else {
      return 'Dinner';
    }
  }
}

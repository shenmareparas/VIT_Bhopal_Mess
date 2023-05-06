// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Upcomming extends StatelessWidget {
  const Upcomming({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String mealTime = getMealTime(now);
    String formattedDate = DateFormat('EEEE').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);

    print("Day: $formattedDate");
    print("Time: $formattedTime");
    print("Total items: ${days[formattedDate]![mealTime]?.length}");

    if (days[formattedDate] != null && days[formattedDate]![mealTime] != null) {
      print(days[formattedDate]![mealTime]);
    } else {
      print('No meal found for $formattedDate at $mealTime');
    }

    return Scaffold(
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
    "Monday": {
      "Breakfast": [
        "Idly, Midhu Vada",
        "Chutney, Sambar",
        "Banana/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      "Lunch": [
        "Salad",
        "Roti",
        "Rajma Gharwala",
        "Jeera Rice",
        "Aloo Pepper Fry",
        "Rice",
        "Lemon Rice",
        "Koottu",
        "Rasam",
        "Juice"
      ],
      "Snacks": ["Vada Pav", "Tea, Coffee, Milk"],
      "Dinner": [
        "Roti",
        "Kashmiri Pulao",
        "Egg Bhurji Masala",
        "Plain Dal",
        "Rice",
        "Rasam",
        "Pickle"
      ],
    },
    "Tuesday": {
      "Breakfast": [
        "Veg Paratha",
        "Veg Sabji",
        "Banava/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      "Lunch": [
        "Salad",
        "Poori",
        "Chana Masala",
        "Plain Rice",
        "Dal Tadka",
        "Sambar",
        "Rasam",
        "Carrot Beans Poriyal",
        "Curd"
      ],
      "Snacks": ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
      "Dinner": [
        "Roti",
        "Kuska",
        "Aloo Meal Maker Sabji",
        "Masala Dal",
        "Rasam",
        "Pickle",
        "Halwa"
      ],
    },
    "Wednesday": {
      "Breakfast": [
        "Uthappam",
        "Sambhar",
        "Karachutany",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      "Lunch": [
        "Salad",
        "Roti",
        "Veg Hariyali",
        "Rice",
        "Mix Dal",
        "Palak Koottu Sabji",
        "Rasam",
        "Curd Rice",
        "Payasam/Boondi"
      ],
      "Snacks": ["Pani Poori", "Tea, Coffee, Milk"],
      "Dinner": [
        "Roti",
        "Rice",
        "Plain Dal",
        "Capsicum Onion Chicken",
        "Butter Paneer",
        "Rasam",
        "Pickle"
      ],
    },
    "Thursday": {
      "Breakfast": [
        "Poha, Pongal",
        "Jalebi",
        "Banana/ Fruit Salad",
        "Chutney",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      "Lunch": [
        "Salad",
        "Roti",
        "Navratan Kurma",
        "Tomato Dal (Andhara Style)",
        "Veg Pulao",
        "Plain Rice",
        "Drumstick, Bagan, Poriyal",
        "Rasam",
        "Pickle",
        "Butter Milk"
      ],
      "Snacks": ["Sweet Corn Salad", "Tea, Coffee, Milk"],
      "Dinner": [
        "Roti",
        "Green Peas Masala",
        "Egg Bhurji",
        "Rice",
        "Dal Fry",
        "Rasam",
        "Pickle"
      ],
    },
    "Friday": {
      "Breakfast": [
        "Bhatura",
        "Chole Masala",
        "Banana/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      "Lunch": [
        "Raitha",
        "Veg Biryani",
        "Roti",
        "Palak Dal",
        "Plain Rice",
        "Tomato Hokku",
        "Rasam",
        "Fryums",
      ],
      "Snacks": ["Cake/Patties", "Tea, Coffee, Milk"],
      "Dinner": [
        "Roti",
        "Rice",
        "Dal Tadka",
        "Chettandu Chicken",
        "Kadhai Paneer",
        "Rasam",
        "Pickle"
      ],
    },
    "Saturday": {
      "Breakfast": [
        "Pav Bhaji",
        "Uppma",
        "Banana/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      "Lunch": [
        "Salad",
        "Roti",
        "Chana Dal",
        "Kitchadi/Tamarind Rice",
        "Baingan Bharta",
        "Rice",
        "Vegetable Sambhar",
        "Raw Banana Poriyal",
        "Rasam",
        "Butter Milk"
      ],
      "Snacks": ["Samosa", "Tea, Coffee, Milk"],
      "Dinner": [
        "Chapati",
        "Fried Rice",
        "Dal Fry",
        "Gobi Monchuriyan",
        "Rice",
        "Rasam",
      ],
    },
    "Sunday": {
      "Breakfast": [
        "Masala Dosa",
        "Sambar, Chutney",
        "Banana/Fruit Salad",
        "Bread",
        "Butter/Jam",
        "Tea, Coffee, Milk"
      ],
      "Lunch": [
        "Onion Cucumber Raitha",
        "Roti",
        "Chicken Biryani",
        "Paneer Biryani",
        "Masala Dal",
        "Mint Lemon Juice"
      ],
      "Snacks": ["Dhokla/Pasta", "Green Chutney", "Tea, Coffee, Milk"],
      "Dinner": [
        "Chapathi",
        "Rice",
        "Tinda Aloo Sabji/Allo Patha Gobi",
        "Dal Makhani",
        "Rasam",
        "Gulab Jamun/Bondi"
      ],
    },
  };

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

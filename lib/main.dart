import 'package:intl/intl.dart';
// ignore_for_file: avoid_print

void main() {
  var days = {
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
      'Evening Snacks': ["Vada Pav", "Tea, Coffee, Milk"],
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
      'Evening Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
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
      'Evening Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
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
      'Evening Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
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
      'Evening Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
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
      'Evening Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
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
      'Evening Snacks': ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
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

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE').format(now);
  String formattedTime = DateFormat('HH:mm').format(now);
  print(formattedDate);
  print(formattedTime);

  print(days[formattedDate]!['Dinner']);
}

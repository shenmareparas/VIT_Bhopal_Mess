import 'package:intl/intl.dart';

import '../models/map.dart';

DateTime now = DateTime.now();
DateTime nextDay = DateTime.now().add(const Duration(days: 1));
String mealTime = getMealTime(now);
String formattedDate = DateFormat('EEEE').format(now);
String nextDayformattedDate = DateFormat('EEEE').format(nextDay);
String formattedTime = DateFormat('HH:mm').format(now);

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

String getformattedDate(DateTime nextDay) {
  int hour = now.hour;
  if (hour < 21) {
    return formattedDate;
  } else {
    return nextDayformattedDate;
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

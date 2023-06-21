import 'package:intl/intl.dart';
import '/models/map.dart';

DateTime now = DateTime.now();
String mealTime = getMealTime(now);
String formattedDate = DateFormat('EEEE').format(now);
String formattedTime = DateFormat('HH:mm').format(now);

int hour = now.hour;
int minute = now.minute;

String getMealTime(now) {
  if (hour < 9) {
    return 'Breakfast';
  } else if (hour < 14 || (hour == 14 && minute <= 30)) {
    return 'Lunch';
  } else if (hour < 18 || (hour == 18 && minute <= 30)) {
    return 'Snacks';
  } else if (hour < 21) {
    return 'Dinner';
  } else {
    return 'Breakfast';
  }
}

String getformattedDate(now) {
  if (hour >= 21 && hour < 24) {
    DateTime nextDay = DateTime.now().add(const Duration(days: 1));
    String formattedDate = DateFormat('EEEE').format(nextDay);
    return formattedDate;
  } else {
    return formattedDate;
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
var mealShow = [
  "Breakfast (7:30 to 9:00 AM)",
  "Lunch (12:00 to 2:30 PM)",
  "Snacks (5:00 to 6:30 PM)",
  "Dinner (7:30 to 9:00 PM)"
];

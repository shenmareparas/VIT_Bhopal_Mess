import 'package:vit_bhopal_mess/models/map.dart';
import 'package:vit_bhopal_mess/provider/mess_provider.dart';

DateTime get now => DateTime.now();
String get mealTime => MessProvider.calculateMealTime(DateTime.now());

String getMealTime(DateTime now) {
  return MessProvider.calculateMealTime(now);
}

Map getMess(int selectedMess) {
  switch (selectedMess) {
    case 1:
      return mess_1;
    case 2:
      return mess_2;
    case 3:
      return mess_3;
    case 4:
      return mess_4;
    default:
      return mess_1;
  }
}

const List<String> days = MessProvider.days;
const List<String> meal = MessProvider.mealTypes;
const List<String> mealShow = MessProvider.mealDescriptions;

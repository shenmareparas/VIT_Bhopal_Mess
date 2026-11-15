import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:vit_bhopal_mess/models/map.dart';

class MessProvider with ChangeNotifier {
  static const String _selectedMessKey = 'selectedMess';

  int _selectedMess = 1;
  String _formattedDate = DateFormat('EEEE').format(DateTime.now());
  String _mealTime = '';

  MessProvider() {
    _mealTime = calculateMealTime(DateTime.now());
  }

  int get selectedMess => _selectedMess;
  String get formattedDate => _formattedDate;
  String get mealTime => _mealTime;

  static const List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  static const List<String> mealTypes = [
    'Breakfast',
    'Lunch',
    'Snacks',
    'Dinner',
  ];

  static const List<String> mealDescriptions = [
    'Breakfast (7:30 to 9:00)',
    'Lunch (12:00 to 14:30)',
    'Snacks (17:00 to 18:30)',
    'Dinner (19:30 to 21:00)',
  ];

  static String calculateMealTime(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;

    if (hour < 9) {
      return 'Breakfast';
    } else if (hour < 14 || (hour == 14 && minute <= 30)) {
      return 'Lunch';
    } else if (hour < 18 || (hour == 18 && minute <= 30)) {
      return 'Snacks';
    } else {
      return 'Dinner';
    }
  }

  Map<String, Map<String, List<String>>> getMessSchedule(int messId) {
    switch (messId) {
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

  List<String> get currentMealItems {
    final schedule = getMessSchedule(_selectedMess);
    return schedule[_formattedDate]?[_mealTime] ?? [];
  }

  Future<void> loadSelectedMess() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMess = prefs.getInt(_selectedMessKey);
    if (savedMess != null && savedMess != _selectedMess) {
      _selectedMess = savedMess;
      notifyListeners();
    }
  }

  Future<void> setSelectedMess(int messId) async {
    if (_selectedMess == messId) return;
    _selectedMess = messId;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_selectedMessKey, messId);
    notifyListeners();
  }

  void setDate(String day) {
    if (_formattedDate != day) {
      _formattedDate = day;
      notifyListeners();
    }
  }

  void setMealTime(String meal) {
    if (_mealTime != meal) {
      _mealTime = meal;
      notifyListeners();
    }
  }

  void resetToCurrentDateTime() {
    final now = DateTime.now();
    _formattedDate = DateFormat('EEEE').format(now);
    _mealTime = calculateMealTime(now);
    notifyListeners();
  }
}

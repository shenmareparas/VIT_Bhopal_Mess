import 'package:flutter/material.dart';
import 'timetable.dart';
import 'color_schemes.dart';

int selectedMess = 1;
ColorScheme apptheme = lightColorScheme;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static final GlobalKey<TimetableState> timetableKey =
      GlobalKey<TimetableState>();

  void handleMessSelection(int? value) {
    setState(() {
      selectedMess = value!;
      _SettingsState.timetableKey.currentState?.updateImage();
    });
  }

  void handleappthemeSelection(colorScheme) {
    setState(() {
      apptheme = colorScheme!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
            style: TextStyle(
              fontSize: 25,
              // color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    const Text(
                      'Choose your Mess',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    RadioListTile(
                      title: const Text('Boys Hostel 1 CRCL Mess'),
                      value: 1,
                      groupValue: selectedMess,
                      onChanged: handleMessSelection,
                    ),
                    RadioListTile(
                      title: const Text('Boys Hostel 2 Mayuri Mess'),
                      value: 2,
                      groupValue: selectedMess,
                      onChanged: handleMessSelection,
                    ),
                    RadioListTile(
                      title: const Text('Girls Hostel CRCL Mess'),
                      value: 3,
                      groupValue: selectedMess,
                      onChanged: handleMessSelection,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    const Text(
                      'App Theme',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    RadioListTile(
                      title: const Row(
                        children: [
                          Icon(Icons.wb_sunny),
                          SizedBox(width: 10),
                          Text('Light Mode'),
                        ],
                      ),
                      value: lightColorScheme,
                      groupValue: apptheme,
                      onChanged: handleappthemeSelection,
                    ),
                    RadioListTile(
                      title: const Row(
                        children: [
                          Icon(Icons.nightlight_round),
                          SizedBox(width: 10),
                          Text('Dark Mode'),
                        ],
                      ),
                      value: darkColorScheme,
                      groupValue: apptheme,
                      onChanged: handleappthemeSelection,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

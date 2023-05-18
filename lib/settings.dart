import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:app_settings/app_settings.dart';

int selectedMess = 1;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void handleMessSelection(int? value) async {
    setState(() {
      selectedMess = value!;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("selectedMess", selectedMess);
  }

  void saveselectedMess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("selectedMess", selectedMess);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    const Text(
                      'Choose Mess',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
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
                    const SizedBox(height: 10),
                    const Text('Note: After changing Mess, please click Reset',
                        style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    const Text('App Theme',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    const Text('App Theme is set to System Default',
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 15),
                    const Text(
                        'Note: To change app theme, change your system theme',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13)),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        AppSettings.openDisplaySettings();
                      },
                      child: const Text('Open Display Settings'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

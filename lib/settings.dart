import 'package:flutter/material.dart';
import 'timetable.dart';
import "package:shared_preferences/shared_preferences.dart";

int selectedMess = 1;

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
            style: TextStyle(
              fontSize: 25,
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
                      'Choose Mess',
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
            const Card(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    Text(
                      'App Theme',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          'App Theme is set to System Default.\n\nTo change App Theme change your System Theme.',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center),
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

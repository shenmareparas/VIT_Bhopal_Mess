import 'package:flutter/material.dart';

int? selectedMess = 1;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int? apptheme = 1;

  void _handleMessSelection(int? value) {
    setState(() {
      selectedMess = value;
    });
  }

  void _handleappthemeSelection(int? value) {
    setState(() {
      apptheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your Mess:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            RadioListTile(
              activeColor: Colors.blueGrey[900],
              title: const Text('Boys Hostel 1 CRCL Mess'),
              value: 1,
              groupValue: selectedMess,
              onChanged: _handleMessSelection,
            ),
            RadioListTile(
              activeColor: Colors.blueGrey[900],
              title: const Text('Boys Hostel 2 Mayuri Mess'),
              value: 2,
              groupValue: selectedMess,
              onChanged: _handleMessSelection,
            ),
            RadioListTile(
              activeColor: Colors.blueGrey[900],
              title: const Text('Girls Hostel CRCL Mess'),
              value: 3,
              groupValue: selectedMess,
              onChanged: _handleMessSelection,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'App Theme:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            RadioListTile(
              activeColor: Colors.blueGrey[900],
              title: const Text('Light Mode'),
              value: 1,
              groupValue: apptheme,
              onChanged: _handleappthemeSelection,
            ),
            RadioListTile(
              activeColor: Colors.blueGrey[900],
              title: const Text('Dark Mode'),
              value: 2,
              groupValue: apptheme,
              onChanged: _handleappthemeSelection,
            )
          ],
        ),
      ),
    );
  }
}

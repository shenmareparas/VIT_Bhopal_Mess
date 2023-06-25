import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:shared_preferences/shared_preferences.dart";
import '/provider/theme_provider.dart';

int selectedMess = 1;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
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
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                    RadioListTile.adaptive(
                      title: const Text('Boys Hostel 1 CRCL Mess'),
                      value: 1,
                      groupValue: selectedMess,
                      onChanged: handleMessSelection,
                    ),
                    RadioListTile.adaptive(
                      title: const Text('Boys Hostel 2 & 3 Mayuri Mess'),
                      value: 2,
                      groupValue: selectedMess,
                      onChanged: handleMessSelection,
                    ),
                    RadioListTile.adaptive(
                      title: const Text('Girls Hostel CRCL Mess'),
                      value: 3,
                      groupValue: selectedMess,
                      onChanged: handleMessSelection,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Note: After changing Mess,\nplease click Refresh or swipe down to Refresh',
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 16, right: 16),
                child: Column(
                  children: [
                    const Text('App Theme',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    ListTile(
                      title: const Text('Dark Mode'),
                      trailing: Switch.adaptive(
                        value: themeProvider.currentThemeType == ThemeType.dark,
                        onChanged: (_) {
                          themeProvider.toggleTheme();
                        },
                      ),
                      onTap: () {
                        themeProvider.toggleTheme();
                      },
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

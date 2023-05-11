import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schemes.dart';
import 'upcoming.dart';
import 'timetable.dart';
import 'settings.dart';
import 'about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: GoogleFonts.karlaTextTheme()),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Builder(builder: (BuildContext context) {
                return PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 'settings',
                        child: Text('Settings'),
                      ),
                      const PopupMenuItem(
                        value: 'about',
                        child: Text('About'),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 'settings') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()),
                      );
                    } else if (value == 'about') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const About()),
                      );
                    }
                  },
                );
              }),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(text: "Upcoming", icon: Icon(Icons.restaurant)),
                Tab(text: "Timetable", icon: Icon(Icons.table_chart))
              ],
            ),
            centerTitle: true,
            title: const Text('VIT Bhopal Mess',
                style: TextStyle(
                  fontSize: 25,
                )),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [Upcoming(), Timetable()],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'upcoming.dart';
import 'timetable.dart';
import 'settings.dart';
import 'about.dart';
import 'color_schemes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
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
                        child: Text(
                          'Settings',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'about',
                        child: Text(
                          'About',
                          style: TextStyle(fontSize: 17),
                        ),
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
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
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

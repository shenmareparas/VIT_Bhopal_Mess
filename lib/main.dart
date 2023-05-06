import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'upcoming.dart';
import 'timetable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Upcoming", icon: Icon(FontAwesomeIcons.utensils)),
                Tab(text: "Timetable", icon: Icon(FontAwesomeIcons.table))
              ],
            ),
            title: const Center(
                child: Text(
              'VIT Bhopal Mess',
              style: TextStyle(color: Colors.white),
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

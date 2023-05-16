import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'canteen.dart';
import 'upcoming.dart';
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
  void readselectedMess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedselectedMess = prefs.getInt("selectedMess");
    if (savedselectedMess != null) {
      setState(() {
        selectedMess = savedselectedMess;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readselectedMess();
  }

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
            bottom: const TabBar(
              tabs: [
                Tab(text: "Upcoming", icon: Icon(Icons.restaurant)),
                Tab(text: "Canteen", icon: Icon(Icons.storefront)),
              ],
            ),
            centerTitle: true,
            title: const Text('VIT Bhopal Mess',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            actions: [
              Builder(builder: (BuildContext context) {
                return PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 'Settings',
                        child: Text(
                          'Settings',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'About',
                        child: Text(
                          'About',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 'Settings') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()),
                      );
                    } else if (value == 'About') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const About()),
                      );
                    }
                  },
                );
              }),
            ],
          ),
          body: const TabBarView(
            children: [Upcoming(), Canteen()],
          ),
        ),
      ),
    );
  }
}

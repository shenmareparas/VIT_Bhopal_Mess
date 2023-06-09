import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/utils/floating_snackbar.dart';
import 'package:upgrader/upgrader.dart';
import 'settings.dart';
import 'upcoming.dart';
import 'about.dart';
import 'canteen.dart';
import 'underbelly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            tabs: const [
              Tab(text: "Upcoming", icon: Icon(Icons.restaurant_rounded)),
              Tab(text: "Canteen", icon: Icon(Icons.storefront)),
              Tab(text: "UnderBelly", icon: Icon(Icons.fastfood_rounded)),
            ],
          ),
          centerTitle: true,
          title: const Text('VIT Bhopal Mess', style: TextStyle(fontSize: 25)),
          actions: [
            Builder(
              builder: (BuildContext context) => PopupMenuButton(
                tooltip: "More Options",
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'Settings',
                    child: Text('Settings', style: TextStyle(fontSize: 17)),
                  ),
                  const PopupMenuItem(
                    value: 'About',
                    child: Text('About', style: TextStyle(fontSize: 17)),
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case 'Settings':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()),
                      );
                      break;
                    case 'About':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const About()),
                      );
                      break;
                    default:
                      showFloatingSnackbar(context, 'Error Case not Found');
                  }
                },
              ),
            ),
          ],
        ),
        body: UpgradeAlert(
          upgrader: Upgrader(
            dialogStyle: kIsWeb
                ? UpgradeDialogStyle.material
                : (Platform.isAndroid
                    ? UpgradeDialogStyle.material
                    : UpgradeDialogStyle.cupertino),
            canDismissDialog: false,
            durationUntilAlertAgain: const Duration(days: 1),
          ),
          child: const TabBarView(
            children: [Upcoming(), Canteen(), UnderBelly()],
          ),
        ),
      ),
    );
  }
}

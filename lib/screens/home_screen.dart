import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vit_bhopal_mess/screens/settings.dart';
import 'package:vit_bhopal_mess/screens/upcoming.dart';

import '../utils/floating_snackbar.dart';
import 'about.dart';
import 'canteen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            tabs: const [
              Tab(text: "Upcoming", icon: Icon(Icons.restaurant)),
              Tab(text: "Canteen", icon: Icon(Icons.storefront)),
            ],
          ),
          centerTitle: true,
          title: const Text('VIT Bhopal Mess',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
          actions: [
            Builder(
              builder: (BuildContext context) => PopupMenuButton(
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
        body: const TabBarView(
          children: [Upcoming(), Canteen()],
        ),
      ),
    );
  }
}

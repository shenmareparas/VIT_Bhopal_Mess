import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '/utils/floating_snackbar.dart';
import 'package:upgrader/upgrader.dart';
import 'developer.dart';
import 'mayuri.dart';
import 'settings.dart';
import 'mess.dart';
import 'about.dart';
import 'canteen.dart';
import 'underbelly.dart';
import 'package:share_plus/share_plus.dart';

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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            tabs: const [
              Tab(text: "Mess", icon: Icon(FontAwesomeIcons.utensils)),
              Tab(text: "UB", icon: Icon(FontAwesomeIcons.burger)),
              Tab(text: "Mayuri's", icon: Icon(FontAwesomeIcons.store)),
              Tab(text: "Canteen", icon: Icon(FontAwesomeIcons.hotel)),
            ],
          ),
          centerTitle: true,
          title: const Text('VIT Bhopal Mess', style: TextStyle(fontSize: 25)),
          actions: [
            Builder(
              builder: (BuildContext context) => PopupMenuButton(
                position: PopupMenuPosition.under,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                tooltip: "More Options",
                icon: const Icon(FontAwesomeIcons.ellipsisVertical),
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'Settings',
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 10),
                        Text('Settings', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'Share',
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 10),
                        Text('Share', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'Rate Us',
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(width: 10),
                        Text('Rate Us', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'Developer',
                    child: Row(
                      children: [
                        Icon(Icons.android),
                        SizedBox(width: 10),
                        Text('Developer', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'About',
                    child: Row(
                      children: [
                        Icon(Icons.info),
                        SizedBox(width: 10),
                        Text('About', style: TextStyle(fontSize: 17)),
                      ],
                    ),
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
                    case 'Share':
                      Share.share(
                          '"VIT Bhopal Mess" App and website, specifically designed to enhance the dining experience for VIT Bhopal students 🍽\n\n(Google Play Store)\nhttps://play.google.com/store/apps/details?id=com.shenmareparas.vit_mess\n☝☝☝\n\n(Website)\nvitbmess.vercel.app\n☝☝☝');
                      break;
                    case 'Rate Us':
                      launchUrlString(
                          mode: LaunchMode.externalNonBrowserApplication,
                          "https://play.google.com/store/apps/details?id=com.shenmareparas.vit_mess");
                      break;
                    case 'Developer':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Developer()),
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
          dialogStyle: kIsWeb
              ? UpgradeDialogStyle.material
              : (Platform.isAndroid
                  ? UpgradeDialogStyle.material
                  : UpgradeDialogStyle.cupertino),
          barrierDismissible: false,
          upgrader: Upgrader(
            durationUntilAlertAgain: const Duration(days: 1),
          ),
          child: const TabBarView(
            children: [Mess(), UnderBelly(), Mayuri(), Canteen()],
          ),
        ),
      ),
    );
  }
}

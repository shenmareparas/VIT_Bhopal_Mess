import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            labelPadding: const EdgeInsets.symmetric(horizontal: 12),
            tabs: const [
              Tab(text: "Mess", icon: FaIcon(FontAwesomeIcons.utensils)),
              Tab(text: "UB", icon: FaIcon(FontAwesomeIcons.burger)),
              Tab(text: "Mayuri's", icon: FaIcon(FontAwesomeIcons.store)),
              Tab(text: "Canteen", icon: FaIcon(FontAwesomeIcons.hotel)),
            ],
          ),
          centerTitle: true,
          title: Text(
            'VIT Bhopal Mess',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          actions: [
            Builder(
              builder: (BuildContext context) => PopupMenuButton(
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .outlineVariant
                        .withValues(alpha: 0.4),
                  ),
                ),
                tooltip: "More Options",
                icon: const FaIcon(FontAwesomeIcons.ellipsisVertical),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'Settings',
                    child: Row(
                      children: [
                        Icon(Icons.settings_outlined,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 12),
                        const Text('Settings',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Share',
                    child: Row(
                      children: [
                        Icon(Icons.share_outlined,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 12),
                        const Text('Share',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Rate Us',
                    child: Row(
                      children: [
                        Icon(Icons.star_outline_rounded,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 12),
                        const Text('Rate Us',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Developer',
                    child: Row(
                      children: [
                        Icon(Icons.code_rounded,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 12),
                        const Text('Developer',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'About',
                    child: Row(
                      children: [
                        Icon(Icons.info_outline_rounded,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 12),
                        const Text('About',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
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
                      SharePlus.instance.share(
                        ShareParams(
                          text:
                              '"VIT Bhopal Mess" App and website, specifically designed to enhance the dining experience for VIT Bhopal students 🍽\n\n(Google Play Store)\nhttps://play.google.com/store/apps/details?id=com.shenmareparas.vit_mess\n☝☝☝\n\n(Website)\nvitbmess.vercel.app\n☝☝☝',
                        ),
                      );
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

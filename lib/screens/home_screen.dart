import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vit_bhopal_mess/provider/mess_provider.dart';
import 'package:vit_bhopal_mess/provider/theme_provider.dart';
import 'package:vit_bhopal_mess/widgets/responsive_layout.dart';
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
    final isWide = Breakpoints.isWide(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDesktopPlatform =
        !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
    final disableNavSwipe =
        kIsWeb || isDesktopPlatform || Breakpoints.isDesktop(context);

    final List<Widget> tabs = isWide
        ? const [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.utensils, size: 14),
                  SizedBox(width: 8),
                  Text('Mess', style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.burger, size: 14),
                  SizedBox(width: 8),
                  Text('UnderBelly',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.store, size: 14),
                  SizedBox(width: 8),
                  Text("Mayuri's",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.hotel, size: 14),
                  SizedBox(width: 8),
                  Text('Canteen',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ]
        : const [
            Tab(text: "Mess", icon: FaIcon(FontAwesomeIcons.utensils)),
            Tab(text: "UB", icon: FaIcon(FontAwesomeIcons.burger)),
            Tab(text: "Mayuri's", icon: FaIcon(FontAwesomeIcons.store)),
            Tab(text: "Canteen", icon: FaIcon(FontAwesomeIcons.hotel)),
          ];

    final moreOptions = Builder(
      builder: (BuildContext context) {
        final menuItems = [
          PopupMenuItem(
            value: 'Settings',
            child: Row(
              children: [
                Icon(Icons.settings_outlined, color: colorScheme.primary),
                const SizedBox(width: 12),
                const Text('Settings',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Share',
            child: Row(
              children: [
                Icon(Icons.share_outlined, color: colorScheme.primary),
                const SizedBox(width: 12),
                const Text('Share',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Rate Us',
            child: Row(
              children: [
                Icon(Icons.star_outline_rounded, color: colorScheme.primary),
                const SizedBox(width: 12),
                const Text('Rate Us',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Developer',
            child: Row(
              children: [
                Icon(Icons.code_rounded, color: colorScheme.primary),
                const SizedBox(width: 12),
                const Text('Developer',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'About',
            child: Row(
              children: [
                Icon(Icons.info_outline_rounded, color: colorScheme.primary),
                const SizedBox(width: 12),
                const Text('About',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ];

        void handleSelected(String value) {
          switch (value) {
            case 'Settings':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
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
                MaterialPageRoute(builder: (context) => const Developer()),
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
        }

        if (isWide) {
          return PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            offset: const Offset(0, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: colorScheme.outlineVariant.withValues(alpha: 0.4),
              ),
            ),
            tooltip: "More Options",
            onSelected: handleSelected,
            itemBuilder: (BuildContext context) => menuItems,
            child: Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                ),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.ellipsisVertical,
                  size: 15,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          );
        }

        return PopupMenuButton<String>(
          position: PopupMenuPosition.under,
          offset: const Offset(0, 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: colorScheme.outlineVariant.withValues(alpha: 0.4),
            ),
          ),
          tooltip: "More Options",
          icon: const FaIcon(FontAwesomeIcons.ellipsisVertical, size: 16),
          onSelected: handleSelected,
          itemBuilder: (BuildContext context) => menuItems,
        );
      },
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isWide ? 82 : 62,
          titleSpacing: isWide ? 32 : NavigationToolbar.kMiddleSpacing,
          actionsPadding: EdgeInsets.only(right: isWide ? 32 : 8),
          centerTitle: !isWide,
          elevation: 0,
          scrolledUnderElevation: 1,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isWide) ...[
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.utensils,
                      size: 19,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
              ],
              Column(
                crossAxisAlignment: isWide
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'VIT Bhopal Mess',
                    style: TextStyle(
                      fontSize: isWide ? 21 : 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  if (isWide) ...[
                    const SizedBox(height: 3),
                    Text(
                      'Dining & Eateries Portal',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurfaceVariant,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(isWide ? 56 : 72),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: isWide ? 4 : 0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.35),
                    width: 1,
                  ),
                ),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isWide ? 620 : double.infinity,
                  ),
                  child: TabBar(
                    onTap: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: isWide ? 20 : 12,
                    ),
                    tabs: tabs,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            if (isWide) ...[
              Consumer<MessProvider>(
                builder: (context, messProvider, _) {
                  return PopupMenuButton<int>(
                    tooltip: 'Change Caterer Mess',
                    position: PopupMenuPosition.under,
                    offset: const Offset(0, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color:
                            colorScheme.outlineVariant.withValues(alpha: 0.4),
                      ),
                    ),
                    onSelected: (val) => messProvider.setSelectedMess(val),
                    itemBuilder: (context) =>
                        MessProvider.messNames.entries.map((entry) {
                      final isSelected = entry.key == messProvider.selectedMess;
                      return PopupMenuItem<int>(
                        value: entry.key,
                        child: Row(
                          children: [
                            Icon(
                              isSelected
                                  ? Icons.check_circle_rounded
                                  : Icons.radio_button_unchecked_rounded,
                              size: 18,
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.outline,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              entry.value,
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    child: Container(
                      height: 42,
                      padding: const EdgeInsets.only(left: 6, right: 12),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(21),
                        border: Border.all(
                          color:
                              colorScheme.outlineVariant.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color:
                                  colorScheme.primary.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.restaurant_menu_rounded,
                                size: 15,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            messProvider.currentMessName,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) {
                  final isDark = theme.brightness == Brightness.dark;
                  return Tooltip(
                    message:
                        isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                    child: InkWell(
                      onTap: () => themeProvider.toggleTheme(),
                      borderRadius: BorderRadius.circular(21),
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHigh,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colorScheme.outlineVariant
                                .withValues(alpha: 0.4),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            isDark
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            size: 19,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
            ],
            moreOptions,
          ],
        ),
        body: (kIsWeb || isDesktopPlatform)
            ? TabBarView(
                physics: disableNavSwipe
                    ? const NeverScrollableScrollPhysics()
                    : null,
                children: const [Mess(), UnderBelly(), Mayuri(), Canteen()],
              )
            : UpgradeAlert(
                dialogStyle: Platform.isAndroid
                    ? UpgradeDialogStyle.material
                    : UpgradeDialogStyle.cupertino,
                barrierDismissible: false,
                upgrader: Upgrader(
                  durationUntilAlertAgain: const Duration(days: 1),
                ),
                child: TabBarView(
                  physics: disableNavSwipe
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  children: const [Mess(), UnderBelly(), Mayuri(), Canteen()],
                ),
              ),
      ),
    );
  }
}

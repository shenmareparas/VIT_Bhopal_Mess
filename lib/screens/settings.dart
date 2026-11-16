import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:vit_bhopal_mess/provider/mess_provider.dart';
import 'package:vit_bhopal_mess/provider/theme_provider.dart';
import 'package:vit_bhopal_mess/widgets/responsive_layout.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final messProvider = Provider.of<MessProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    final isIOS = !kIsWeb && Platform.isIOS;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ResponsiveContentWrapper(
        maxWidth: 760,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 300),
              child: _buildSectionHeader(
                context: context,
                icon: Icons.restaurant_menu_rounded,
                title: 'CATERER PREFERENCE',
              ),
            ),
            const SizedBox(height: 6),
            FadeInUp(
              duration: const Duration(milliseconds: 300),
              child: Card(
                elevation: 0,
                color: colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(isIOS ? 18 : 24),
                  side: BorderSide(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.35),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: RadioGroup<int>(
                  groupValue: messProvider.selectedMess,
                  onChanged: (value) {
                    if (value != null) {
                      if (isIOS) HapticFeedback.selectionClick();
                      messProvider.setSelectedMess(value);
                    }
                  },
                  child: Column(
                    children: [
                      _buildMessTile(
                        context: context,
                        title: 'Boys Hostel 1 CRCL Mess',
                        value: 1,
                        groupValue: messProvider.selectedMess,
                        isIOS: isIOS,
                        onChanged: (val) {
                          if (isIOS) HapticFeedback.selectionClick();
                          messProvider.setSelectedMess(val);
                        },
                      ),
                      _buildDivider(context),
                      _buildMessTile(
                        context: context,
                        title: 'Boys Hostel 2 & 3 Mayuri Mess',
                        value: 2,
                        groupValue: messProvider.selectedMess,
                        isIOS: isIOS,
                        onChanged: (val) {
                          if (isIOS) HapticFeedback.selectionClick();
                          messProvider.setSelectedMess(val);
                        },
                      ),
                      _buildDivider(context),
                      _buildMessTile(
                        context: context,
                        title: 'Boys Hostel 6 Safal Mess',
                        value: 4,
                        groupValue: messProvider.selectedMess,
                        isIOS: isIOS,
                        onChanged: (val) {
                          if (isIOS) HapticFeedback.selectionClick();
                          messProvider.setSelectedMess(val);
                        },
                      ),
                      _buildDivider(context),
                      _buildMessTile(
                        context: context,
                        title: 'Girls Hostel AB Mess',
                        value: 3,
                        groupValue: messProvider.selectedMess,
                        isIOS: isIOS,
                        onChanged: (val) {
                          if (isIOS) HapticFeedback.selectionClick();
                          messProvider.setSelectedMess(val);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 20),
              child: Text(
                'Mess menu and timing schedules reflect your selected caterer across all meal tabs automatically.',
                style: TextStyle(
                  fontSize: 13,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 300),
              delay: const Duration(milliseconds: 150),
              child: _buildSectionHeader(
                context: context,
                icon: Icons.palette_outlined,
                title: 'APPEARANCE',
              ),
            ),
            const SizedBox(height: 6),
            FadeInUp(
              duration: const Duration(milliseconds: 300),
              delay: const Duration(milliseconds: 150),
              child: Card(
                elevation: 0,
                color: colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(isIOS ? 18 : 24),
                  side: BorderSide(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.35),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    _buildThemeTile(
                      context: context,
                      title: 'System Default',
                      subtitle: 'Follow device system appearance',
                      themeType: ThemeType.system,
                      groupValue: themeProvider.currentThemeType,
                      icon: isIOS
                          ? CupertinoIcons.device_phone_portrait
                          : Icons.brightness_auto_rounded,
                      isIOS: isIOS,
                      onChanged: (type) {
                        if (isIOS) HapticFeedback.selectionClick();
                        themeProvider.setThemeType(type);
                      },
                    ),
                    _buildDivider(context),
                    _buildThemeTile(
                      context: context,
                      title: 'Light Theme',
                      subtitle: 'Always use light mode',
                      themeType: ThemeType.light,
                      groupValue: themeProvider.currentThemeType,
                      icon: isIOS
                          ? CupertinoIcons.sun_max_fill
                          : Icons.light_mode_rounded,
                      isIOS: isIOS,
                      onChanged: (type) {
                        if (isIOS) HapticFeedback.selectionClick();
                        themeProvider.setThemeType(type);
                      },
                    ),
                    _buildDivider(context),
                    _buildThemeTile(
                      context: context,
                      title: 'Dark Theme',
                      subtitle: 'Always use dark mode',
                      themeType: ThemeType.dark,
                      groupValue: themeProvider.currentThemeType,
                      icon: isIOS
                          ? CupertinoIcons.moon_fill
                          : Icons.dark_mode_rounded,
                      isIOS: isIOS,
                      onChanged: (type) {
                        if (isIOS) HapticFeedback.selectionClick();
                        themeProvider.setThemeType(type);
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

  Widget _buildSectionHeader({
    required BuildContext context,
    required IconData icon,
    required String title,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: colorScheme.primary,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Divider(
      height: 1,
      thickness: 0.6,
      indent: 52,
      color: colorScheme.outlineVariant.withValues(alpha: 0.25),
    );
  }

  Widget _buildMessTile({
    required BuildContext context,
    required String title,
    required int value,
    required int groupValue,
    required bool isIOS,
    required ValueChanged<int> onChanged,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = value == groupValue;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      onTap: () => onChanged(value),
      leading: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withValues(alpha: 0.15)
              : colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          isIOS ? CupertinoIcons.building_2_fill : Icons.apartment_rounded,
          size: 18,
          color:
              isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          color: colorScheme.onSurface,
        ),
      ),
      trailing: isSelected
          ? Icon(
              isIOS ? CupertinoIcons.checkmark_alt : Icons.check_circle_rounded,
              color: colorScheme.primary,
              size: 20,
            )
          : null,
    );
  }

  Widget _buildThemeTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required ThemeType themeType,
    required ThemeType groupValue,
    required IconData icon,
    required bool isIOS,
    required ValueChanged<ThemeType> onChanged,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = themeType == groupValue;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      onTap: () => onChanged(themeType),
      leading: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withValues(alpha: 0.15)
              : colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 18,
          color:
              isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          color: colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: isSelected
          ? Icon(
              isIOS ? CupertinoIcons.checkmark_alt : Icons.check_circle_rounded,
              color: colorScheme.primary,
              size: 20,
            )
          : null,
    );
  }
}

import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:vit_bhopal_mess/provider/mess_provider.dart';

class Mess extends StatelessWidget {
  const Mess({super.key});

  @override
  Widget build(BuildContext context) {
    final messProvider = Provider.of<MessProvider>(context);
    final currentMealItems = messProvider.currentMealItems;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: RefreshIndicator(
          edgeOffset: 120,
          color: colorScheme.primary,
          backgroundColor: colorScheme.surfaceContainerHigh,
          onRefresh: () async {
            messProvider.resetToCurrentDateTime();
          },
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: const Text(
                                    'Select Day',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: SizedBox(
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: MessProvider.days.length,
                                      itemBuilder: (context, index) {
                                        final day = MessProvider.days[index];
                                        final isSelected =
                                            day == messProvider.formattedDate;
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0),
                                          child: ListTile(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            tileColor: isSelected
                                                ? colorScheme.primaryContainer
                                                : null,
                                            onTap: () {
                                              messProvider.setDate(day);
                                              Navigator.of(dialogContext).pop();
                                            },
                                            leading: Icon(
                                              isSelected
                                                  ? Icons.check_circle_rounded
                                                  : Icons
                                                      .calendar_today_rounded,
                                              color: isSelected
                                                  ? colorScheme
                                                      .onPrimaryContainer
                                                  : colorScheme.primary,
                                              size: 20,
                                            ),
                                            title: Text(
                                              day,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: isSelected
                                                    ? FontWeight.w700
                                                    : FontWeight.w500,
                                                color: isSelected
                                                    ? colorScheme
                                                        .onPrimaryContainer
                                                    : colorScheme.onSurface,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.calendar_month_rounded,
                              size: 18, color: colorScheme.primary),
                          label: Text(
                            messProvider.formattedDate,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 12),
                            backgroundColor: colorScheme.surfaceContainerLow,
                            side: BorderSide(
                              color: colorScheme.outlineVariant
                                  .withValues(alpha: 0.8),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: const Text(
                                    'Select Meal Time',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: SizedBox(
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: MessProvider.mealTypes.length,
                                      itemBuilder: (context, index) {
                                        final mealType =
                                            MessProvider.mealTypes[index];
                                        final mealDesc = MessProvider
                                            .mealDescriptions[index];
                                        final isSelected =
                                            mealType == messProvider.mealTime;
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0),
                                          child: ListTile(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            tileColor: isSelected
                                                ? colorScheme.primary
                                                    .withValues(alpha: 0.15)
                                                : null,
                                            onTap: () {
                                              messProvider
                                                  .setMealTime(mealType);
                                              Navigator.of(dialogContext).pop();
                                            },
                                            leading: Icon(
                                              isSelected
                                                  ? Icons.check_circle_rounded
                                                  : Icons.restaurant_rounded,
                                              color: colorScheme.primary,
                                              size: 20,
                                            ),
                                            title: Text(
                                              mealDesc,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: isSelected
                                                    ? FontWeight.w700
                                                    : FontWeight.w500,
                                                color: colorScheme.onSurface,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.access_time_filled_rounded,
                              size: 18),
                          label: Text(
                            messProvider.mealTime,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 12),
                            backgroundColor: colorScheme.primary,
                            foregroundColor: colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: colorScheme.surfaceContainerLow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(
                          color:
                              colorScheme.outlineVariant.withValues(alpha: 0.4),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: currentMealItems.isEmpty
                            ? Center(
                                child: Text(
                                  'No items found for this meal',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              )
                            : ListView.separated(
                                itemCount: currentMealItems.length,
                                separatorBuilder: (_, __) => Divider(
                                  height: 16,
                                  color: colorScheme.outlineVariant
                                      .withValues(alpha: 0.3),
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return FadeInUp(
                                    duration: const Duration(milliseconds: 250),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6.0, horizontal: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 6),
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: colorScheme.primary,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 14),
                                          Expanded(
                                            child: Text(
                                              currentMealItems[index],
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                height: 1.35,
                                                color: colorScheme.onSurface,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton.extended(
                  elevation: 3,
                  highlightElevation: 5,
                  onPressed: () => messProvider.resetToCurrentDateTime(),
                  tooltip: 'Reset to current meal',
                  icon: const FaIcon(FontAwesomeIcons.rotateRight, size: 16),
                  label: const Text(
                    'Now',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:vit_bhopal_mess/provider/mess_provider.dart';
import 'package:vit_bhopal_mess/widgets/responsive_layout.dart';

class Mess extends StatelessWidget {
  const Mess({super.key});

  @override
  Widget build(BuildContext context) {
    final messProvider = Provider.of<MessProvider>(context);
    final currentMealItems = messProvider.currentMealItems;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isWide = Breakpoints.isWide(context);
    final todayName = DateFormat('EEEE').format(DateTime.now());

    return Scaffold(
      body: ResponsiveContentWrapper(
        maxWidth: 1040,
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
                  if (isWide) ...[
                    // Desktop / Wide Screen Inline Day Selector
                    Row(
                      children: [
                        Text(
                          'DAY',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: MessProvider.days.map((day) {
                                final isSelected =
                                    day == messProvider.formattedDate;
                                final isToday = day == todayName;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ChoiceChip(
                                    showCheckmark: false,
                                    backgroundColor: isSelected
                                        ? colorScheme.primary
                                        : colorScheme.surfaceContainerHigh,
                                    selectedColor: colorScheme.primary,
                                    labelStyle: TextStyle(
                                      color: isSelected
                                          ? colorScheme.onPrimary
                                          : colorScheme.onSurface,
                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    side: BorderSide(
                                      color: isSelected
                                          ? colorScheme.primary
                                          : colorScheme.outlineVariant
                                              .withValues(alpha: 0.35),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    label: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(day),
                                        if (isToday) ...[
                                          const SizedBox(width: 5),
                                          Container(
                                            width: 6,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isSelected
                                                  ? colorScheme.onPrimary
                                                  : colorScheme.primary,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                    selected: isSelected,
                                    onSelected: (_) =>
                                        messProvider.setDate(day),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Desktop / Wide Screen Inline Meal Selector
                    Row(
                      children: [
                        Text(
                          'MEAL',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  MessProvider.mealTypes.length, (index) {
                                final mealType = MessProvider.mealTypes[index];
                                final mealDesc =
                                    MessProvider.mealDescriptions[index];
                                final isSelected =
                                    mealType == messProvider.mealTime;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ChoiceChip(
                                    showCheckmark: false,
                                    backgroundColor: isSelected
                                        ? colorScheme.primary
                                        : colorScheme.surfaceContainerHigh,
                                    selectedColor: colorScheme.primary,
                                    labelStyle: TextStyle(
                                      color: isSelected
                                          ? colorScheme.onPrimary
                                          : colorScheme.onSurface,
                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    side: BorderSide(
                                      color: isSelected
                                          ? colorScheme.primary
                                          : colorScheme.outlineVariant
                                              .withValues(alpha: 0.35),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    avatar: Icon(
                                      isSelected
                                          ? Icons.check_circle_rounded
                                          : Icons.restaurant_rounded,
                                      size: 16,
                                      color: isSelected
                                          ? colorScheme.onPrimary
                                          : colorScheme.primary,
                                    ),
                                    label: Text(mealDesc),
                                    selected: isSelected,
                                    onSelected: (_) =>
                                        messProvider.setMealTime(mealType),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ] else ...[
                    // Mobile Compact Selectors (Opening Dialogs)
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
                                                Navigator.of(dialogContext)
                                                    .pop();
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
                                        itemCount:
                                            MessProvider.mealTypes.length,
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
                                                Navigator.of(dialogContext)
                                                    .pop();
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
                  ],
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
                            : isWide
                                ? GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 440,
                                      mainAxisExtent: 64,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                    ),
                                    itemCount: currentMealItems.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return FadeInUp(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          decoration: BoxDecoration(
                                            color: colorScheme
                                                .surfaceContainerHigh,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                              color: colorScheme.outlineVariant
                                                  .withValues(alpha: 0.3),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
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
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        colorScheme.onSurface,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : ListView.separated(
                                    itemCount: currentMealItems.length,
                                    separatorBuilder: (_, __) => Divider(
                                      height: 16,
                                      color: colorScheme.outlineVariant
                                          .withValues(alpha: 0.3),
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return FadeInUp(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0, horizontal: 8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 6),
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
                                                    color:
                                                        colorScheme.onSurface,
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

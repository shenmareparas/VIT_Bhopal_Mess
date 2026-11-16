import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class DevCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final List<Socials> socials;

  const DevCard({
    super.key,
    required this.name,
    required this.description,
    required this.image,
    required this.socials,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.35),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage: AssetImage(image),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(
              height: 1,
              color: colorScheme.outlineVariant.withValues(alpha: 0.25),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: socials.map((social) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: IconButton.filledTonal(
                    tooltip: social.tooltip,
                    iconSize: social.iconSize > 24 ? 22 : social.iconSize,
                    style: IconButton.styleFrom(
                      backgroundColor: colorScheme.surfaceContainerHigh,
                      foregroundColor: colorScheme.primary,
                      padding: const EdgeInsets.all(12),
                    ),
                    onPressed: () async {
                      final uri = Uri.tryParse(social.link);
                      if (uri != null) {
                        try {
                          final launched = await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                          if (!launched) {
                            await launchUrl(
                              uri,
                              mode: LaunchMode.platformDefault,
                            );
                          }
                        } catch (_) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.platformDefault,
                          );
                        }
                      }
                    },
                    icon: social.icon,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Socials {
  final String tooltip;
  final double iconSize;
  final Widget icon;
  final String link;

  Socials({
    required this.tooltip,
    required this.iconSize,
    required this.icon,
    required this.link,
  });
}

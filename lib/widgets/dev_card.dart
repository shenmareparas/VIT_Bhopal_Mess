import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DevCard extends StatelessWidget {
  final String name;

  final String description;
  final String image;
  final List<Socials> socials;

  const DevCard({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
    required this.socials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(image),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: socials.map((socials) {
                return IconButton(
                  tooltip: socials.tooltip,
                  iconSize: socials.iconSize,
                  onPressed: () {
                    launchUrlString(
                        mode: LaunchMode.externalNonBrowserApplication,
                        socials.link);
                  },
                  icon: socials.icon,
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
  final Icon icon;
  final String link;

  Socials({
    required this.tooltip,
    required this.iconSize,
    required this.icon,
    required this.link,
  });
}

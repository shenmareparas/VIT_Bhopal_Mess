import 'package:animate_do/animate_do.dart';
import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vit_bhopal_mess/widgets/dev_card.dart';

class Developer extends StatelessWidget {
  const Developer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer & Contributors'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                'Creator',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 300),
              child: DevCard(
                name: "Paras Shenmare",
                description: "21 | Yavatmal, Maharashtra",
                image: "assets/images/paras_shenmare.jpg",
                socials: [
                  Socials(
                    tooltip: "GitHub",
                    iconSize: 22,
                    icon: const FaIcon(FontAwesomeIcons.github),
                    link: "https://github.com/shenmareparas",
                  ),
                  Socials(
                    tooltip: "LinkedIn",
                    iconSize: 22,
                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                    link: "https://www.linkedin.com/in/parasshenmare",
                  ),
                  Socials(
                    tooltip: "Google Play",
                    iconSize: 20,
                    icon: const FaIcon(FontAwesomeIcons.googlePlay),
                    link:
                        "https://play.google.com/store/apps/dev?id=5625933656259473047",
                  ),
                  Socials(
                    tooltip: "Instagram",
                    iconSize: 22,
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                    link: "https://www.instagram.com/paras_shenmare",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                'Contributor',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 300),
              delay: const Duration(milliseconds: 150),
              child: DevCard(
                name: "Aman Kumar",
                description: "22 | Meerut, Uttar Pradesh",
                image: "assets/images/aman_singh.jpg",
                socials: [
                  Socials(
                    tooltip: "Instagram",
                    iconSize: 22,
                    icon: const FaIcon(FontAwesomeIcons.instagram),
                    link: "https://www.instagram.com/aman_1311_",
                  ),
                  Socials(
                    tooltip: "LinkedIn",
                    iconSize: 22,
                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                    link: "https://www.linkedin.com/in/amankumarsingh1311",
                  ),
                  Socials(
                    tooltip: "Twitter",
                    iconSize: 22,
                    icon: const FaIcon(FontAwesomeIcons.twitter),
                    link: "https://twitter.com/Aman_Kumar_1311",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

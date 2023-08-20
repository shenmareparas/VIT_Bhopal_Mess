import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Developer extends StatefulWidget {
  const Developer({super.key});

  @override
  State<Developer> createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Developer', style: TextStyle(fontSize: 25)),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 10, left: 5, right: 5),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Paras Shenmare',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '20 | Yavatmal, Maharashtra',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 55,
                                  backgroundImage: AssetImage(
                                      'assets/images/paras_shenmare.jpg'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    tooltip: "Github",
                                    iconSize: 40,
                                    onPressed: () {
                                      launchUrlString(
                                          mode: LaunchMode
                                              .externalNonBrowserApplication,
                                          "https://github.com/shenmareparas");
                                    },
                                    icon: const Icon(FontAwesomeIcons.github)),
                                IconButton(
                                    tooltip: "LinkedIn",
                                    iconSize: 40,
                                    onPressed: () {
                                      launchUrlString(
                                          mode: LaunchMode
                                              .externalNonBrowserApplication,
                                          "https://www.linkedin.com/in/parasshenmare");
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.linkedin)),
                                IconButton(
                                    tooltip: "Instagram",
                                    iconSize: 40,
                                    onPressed: () {
                                      launchUrlString(
                                          mode: LaunchMode
                                              .externalNonBrowserApplication,
                                          "https://www.instagram.com/paras_shenmare");
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.instagram)),
                                IconButton(
                                    tooltip: "Google Play",
                                    iconSize: 33,
                                    onPressed: () {
                                      launchUrlString(
                                          mode: LaunchMode
                                              .externalNonBrowserApplication,
                                          "https://play.google.com/store/apps/dev?id=5625933656259473047");
                                    },
                                    icon: const Icon(
                                        FontAwesomeIcons.googlePlay)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Contributor :',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 200),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 10, left: 5, right: 5),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Aman Singh',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '21 | Meerut, Uttar Pradesh',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 55,
                                  backgroundImage: AssetImage(
                                      'assets/images/aman_singh.jpg'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    tooltip: "Instagram",
                                    iconSize: 40,
                                    onPressed: () {
                                      launchUrlString(
                                          mode: LaunchMode
                                              .externalNonBrowserApplication,
                                          "https://www.instagram.com/aman_1311_");
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.instagram)),
                                IconButton(
                                    tooltip: "LinkedIn",
                                    iconSize: 40,
                                    onPressed: () {
                                      launchUrlString(
                                          mode: LaunchMode
                                              .externalNonBrowserApplication,
                                          "https://www.linkedin.com/in/amankumarsingh1311");
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.linkedin)),
                                IconButton(
                                    tooltip: "Twitter",
                                    iconSize: 40,
                                    onPressed: () {
                                      launchUrlString(
                                          mode: LaunchMode
                                              .externalNonBrowserApplication,
                                          "https://twitter.com/Aman_Kumar_1311");
                                    },
                                    icon: const Icon(FontAwesomeIcons.twitter)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 400),
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 10, left: 5, right: 5),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shreya Saha',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '20 | Thane, Maharashtra',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 55,
                                  backgroundImage: AssetImage(
                                      'assets/images/shreya_saha.jpg'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    tooltip: "Instagram",
                                    iconSize: 40,
                                    onPressed: () {
                                      launchUrlString(
                                          mode: LaunchMode
                                              .externalNonBrowserApplication,
                                          "https://instagram.com/shreya.sahahaha");
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.instagram)),
                                IconButton(
                                    tooltip: "E-mail",
                                    iconSize: 40,
                                    onPressed: () {
                                      String email = 'shreyruby@gmail.com';
                                      String subject = 'VIT Bhopal Mess';
                                      String mailto = Uri.encodeFull(
                                          'mailto:$email?subject=$subject');
                                      launchUrlString(mailto);
                                    },
                                    icon: const Icon(Icons.mail_rounded)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 600),
                    child: const Card(
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 10, left: 5, right: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spelldrake',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '? | Unknown',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 55,
                                  backgroundImage: AssetImage(
                                      'assets/images/spelldrake.jpg'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

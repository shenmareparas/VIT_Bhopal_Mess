import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vit_bhopal_mess/widgets/dev_card.dart';

class Developer extends StatelessWidget {
  const Developer({super.key});

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
                    child: DevCard(
                      name: "Paras Shenmare",
                      description: "21 | Yavatmal, Maharashtra",
                      image: "assets/images/paras_shenmare.jpg",
                      socials: [
                        Socials(
                          tooltip: "Github",
                          iconSize: 40,
                          icon: const Icon(FontAwesomeIcons.github),
                          link: "https://github.com/shenmareparas",
                        ),
                        Socials(
                          tooltip: "LinkedIn",
                          iconSize: 40,
                          icon: const Icon(FontAwesomeIcons.linkedin),
                          link: "https://www.linkedin.com/in/parasshenmare",
                        ),
                        Socials(
                          tooltip: "Google Play",
                          iconSize: 33,
                          icon: const Icon(FontAwesomeIcons.googlePlay),
                          link:
                              "https://play.google.com/store/apps/dev?id=5625933656259473047",
                        ),
                        Socials(
                          tooltip: "Instagram",
                          iconSize: 40,
                          icon: const Icon(FontAwesomeIcons.instagram),
                          link: "https://www.instagram.com/paras_shenmare",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Contributor',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 200),
                    child: DevCard(
                        name: "Aman Kumar",
                        description: "22 | Meerut, Uttar Pradesh",
                        image: "assets/images/aman_singh.jpg",
                        socials: [
                          Socials(
                              tooltip: "Instagram",
                              iconSize: 40,
                              icon: const Icon(FontAwesomeIcons.instagram),
                              link: "https://www.instagram.com/aman_1311_"),
                          Socials(
                              tooltip: "LinkedIn",
                              iconSize: 40,
                              icon: const Icon(FontAwesomeIcons.linkedin),
                              link:
                                  "https://www.linkedin.com/in/amankumarsingh1311"),
                          Socials(
                              tooltip: "Twitter",
                              iconSize: 40,
                              icon: const Icon(FontAwesomeIcons.twitter),
                              link: "https://twitter.com/Aman_Kumar_1311"),
                        ]),
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

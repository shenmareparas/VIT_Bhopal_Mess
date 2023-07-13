import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import "package:shared_preferences/shared_preferences.dart";
import '/provider/theme_provider.dart';
import 'home_screen.dart';

int selectedMess = 1;

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  void handleMessSelection(int? value) async {
    setState(() {
      selectedMess = value!;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("selectedMess", selectedMess);
  }

  void saveselectedMess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("selectedMess", selectedMess);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    const bodyStyle = TextStyle(fontSize: 19);

    const pageDecoration = PageDecoration(
      bodyFlex: 3,
      imageFlex: 4,
      safeArea: 80,
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      imagePadding: EdgeInsets.all(16),
    );

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "VIT Bhopal Mess",
              body:
                  "Designed to simplify the process of finding out the correct food item available at the mess based on the current day and time.",
              image: Image.asset(
                'assets/images/icon_circle.png',
                width: 350,
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Choose Mess",
              body: "Select your preferred Mess",
              image: const CircleAvatar(
                radius: 350,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.apartment,
                  color: Color(0xFF5D9214),
                  size: 250,
                  weight: 100,
                ),
              ),
              decoration: pageDecoration,
              footer: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? const Color(0xFF4E6700).withOpacity(0.2)
                        : const Color(0xFFD0EE82).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<int>(
                    value: selectedMess,
                    onChanged: handleMessSelection,
                    isExpanded: true,
                    underline: Container(),
                    items: const [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text(
                          'Boys Hostel 1 CRCL Mess',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text(
                          'Boys Hostel 2 & 3 Mayuri Mess',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text(
                          'Girls Hostel CRCL Mess',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: "App Theme",
              body:
                  "Default is set to Light Theme,\nswitch to change it to Dark Theme.",
              image: const CircleAvatar(
                radius: 300,
                backgroundColor: Colors.white,
                child: Icon(Icons.brightness_4,
                    color: Color(0xFF5D9214), size: 250),
              ),
              decoration: pageDecoration,
              footer: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? const Color(0xFF4E6700).withOpacity(0.2)
                        : const Color(0xFFD0EE82).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: const Text('Dark Mode'),
                    trailing: Switch(
                      value: themeProvider.currentThemeType == ThemeType.dark,
                      onChanged: (_) {
                        themeProvider.toggleTheme();
                      },
                    ),
                    onTap: () {
                      themeProvider.toggleTheme();
                    },
                  ),
                ),
              ),
            )
          ],
          onDone: () => _onIntroEnd(context),
          // onSkip: () =>
          //     _onIntroEnd(context),
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: true,
          back: const Icon(Icons.arrow_back),
          // skip:
          //     const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.arrow_forward),
          done: const Text('Let\'s Go',
              style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12)
              : const EdgeInsets.fromLTRB(8, 4, 8, 4),
          dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            activeSize: Size(22, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}

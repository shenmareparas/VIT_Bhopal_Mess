import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:vit_bhopal_mess/provider/mess_provider.dart';
import '/provider/theme_provider.dart';
import 'home_screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final messProvider = Provider.of<MessProvider>(context);
    const bodyStyle = TextStyle(fontSize: 19);

    const pageDecoration = PageDecoration(
      bodyFlex: 3,
      imageFlex: 4,
      safeArea: 80,
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.transparent,
          allowImplicitScrolling: true,
          autoScrollDuration: 300000,
          infiniteAutoScroll: true,
          pages: [
            PageViewModel(
              title: "Welcome to\nVIT Bhopal Mess",
              body:
                  "Easily track what meal is being served right now at VIT Bhopal.",
              image: const CircleAvatar(
                radius: 300,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.restaurant_menu,
                  color: Color(0xFF5D9214),
                  size: 250,
                ),
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Choose Your Mess",
              body: "Select the mess caterer according to your hostel block.",
              image: const CircleAvatar(
                radius: 300,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.food_bank_outlined,
                  color: Color(0xFF5D9214),
                  size: 250,
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
                        ? const Color(0xFF4E6700).withValues(alpha: 0.2)
                        : const Color(0xFFD0EE82).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<int>(
                    value: messProvider.selectedMess,
                    onChanged: (value) {
                      if (value != null) {
                        messProvider.setSelectedMess(value);
                      }
                    },
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
                        value: 4,
                        child: Text(
                          'Boys Hostel 6 Safal Mess',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text(
                          'Girls Hostel AB Mess',
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
                child: Icon(
                  Icons.brightness_4,
                  color: Color(0xFF5D9214),
                  size: 250,
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
                        ? const Color(0xFF4E6700).withValues(alpha: 0.2)
                        : const Color(0xFFD0EE82).withValues(alpha: 0.2),
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
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: true,
          back: const Icon(Icons.arrow_back),
          next: const Icon(Icons.arrow_forward),
          done: const Text(
            'Let\'s Go',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
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

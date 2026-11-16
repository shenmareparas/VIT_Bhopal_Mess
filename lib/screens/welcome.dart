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
    final colorScheme = Theme.of(context).colorScheme;

    final bodyStyle = TextStyle(
      fontSize: 16,
      color: colorScheme.onSurfaceVariant,
      height: 1.4,
    );

    final pageDecoration = PageDecoration(
      bodyFlex: 3,
      imageFlex: 4,
      safeArea: 80,
      titleTextStyle: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
        color: colorScheme.onSurface,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
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
                  image: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.restaurant_rounded,
                      color: colorScheme.primary,
                      size: 140,
                    ),
                  ),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Choose Your Mess",
                  body:
                      "Select the mess caterer according to your hostel block.",
                  image: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.food_bank_rounded,
                      color: colorScheme.primary,
                      size: 140,
                    ),
                  ),
                  decoration: pageDecoration,
                  footer: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:
                              colorScheme.outlineVariant.withValues(alpha: 0.4),
                        ),
                      ),
                      child: DropdownButton<int>(
                        value: messProvider.selectedMess,
                        onChanged: (value) {
                          if (value != null) {
                            messProvider.setSelectedMess(value);
                          }
                        },
                        isExpanded: true,
                        underline: const SizedBox.shrink(),
                        icon: Icon(Icons.arrow_drop_down_rounded,
                            color: colorScheme.primary),
                        items: const [
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text(
                              'Boys Hostel 1 CRCL Mess',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text(
                              'Boys Hostel 2 & 3 Mayuri Mess',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 4,
                            child: Text(
                              'Boys Hostel 6 Safal Mess',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 3,
                            child: Text(
                              'Girls Hostel AB Mess',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
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
                      "Choose between System Default, Light, and Dark themes anytime.",
                  image: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.palette_rounded,
                      color: colorScheme.primary,
                      size: 140,
                    ),
                  ),
                  decoration: pageDecoration,
                  footer: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:
                              colorScheme.outlineVariant.withValues(alpha: 0.4),
                        ),
                      ),
                      child: DropdownButton<ThemeType>(
                        value: themeProvider.currentThemeType,
                        onChanged: (value) {
                          if (value != null) {
                            themeProvider.setThemeType(value);
                          }
                        },
                        isExpanded: true,
                        underline: const SizedBox.shrink(),
                        icon: Icon(Icons.arrow_drop_down_rounded,
                            color: colorScheme.primary),
                        items: const [
                          DropdownMenuItem<ThemeType>(
                            value: ThemeType.system,
                            child: Text(
                              'System Default',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          DropdownMenuItem<ThemeType>(
                            value: ThemeType.light,
                            child: Text(
                              'Light Theme',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          DropdownMenuItem<ThemeType>(
                            value: ThemeType.dark,
                            child: Text(
                              'Dark Theme',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
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
              back: const Icon(Icons.arrow_back_rounded),
              next: const Icon(Icons.arrow_forward_rounded),
              done: const Text(
                'Let\'s Go',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              curve: Curves.fastLinearToSlowEaseIn,
              controlsMargin: const EdgeInsets.all(16),
              controlsPadding: kIsWeb
                  ? const EdgeInsets.all(12)
                  : const EdgeInsets.fromLTRB(8, 4, 8, 4),
              dotsDecorator: DotsDecorator(
                size: const Size(8, 8),
                activeSize: const Size(24, 8),
                activeColor: colorScheme.primary,
                color: colorScheme.outlineVariant,
                activeShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

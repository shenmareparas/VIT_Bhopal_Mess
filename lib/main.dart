import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vit_bhopal_mess/provider/theme_provider.dart';
import 'package:vit_bhopal_mess/screens/home_screen.dart';
import 'package:vit_bhopal_mess/screens/welcome.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  ThemeProvider themeProvider = ThemeProvider();
  await themeProvider.initializeTheme();
  runApp(
    ChangeNotifierProvider<ThemeProvider>.value(
      value: themeProvider,
      child: const MyApp(),
    ),
  );
}

Future<Widget> firstScreen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;

  await prefs.setBool('firstLaunch', false);

  return isFirstLaunch ? const Welcome() : const HomeScreen();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          title: "VIT Bhopal Mess",
          home: EasySplashScreen(
            logo: Image.asset('assets/images/icon circle.png'),
            logoWidth: 100,
            title: const Text(
              "VIT Bhopal Mess",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: const Color(0xFF001C27),
            showLoader: true,
            loaderColor: const Color(0xFFD0EE82),
            durationInSeconds: 1,
            navigator: FutureBuilder<Widget>(
              future: firstScreen(),
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!;
                } else {
                  return Container();
                }
              },
            ),
          ),
        );
      },
    );
  }
}

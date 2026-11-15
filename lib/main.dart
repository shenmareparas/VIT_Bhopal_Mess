import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:vit_bhopal_mess/models/map.dart';
import 'package:vit_bhopal_mess/provider/canteen_view_model.dart';
import 'package:vit_bhopal_mess/provider/mess_provider.dart';
import '/provider/theme_provider.dart';
import '/screens/home_screen.dart';
import '/screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  ThemeProvider themeProvider = ThemeProvider();
  await themeProvider.initializeTheme();

  MessProvider messProvider = MessProvider();
  await messProvider.loadSelectedMess();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
        ChangeNotifierProvider<MessProvider>.value(value: messProvider),
        ChangeNotifierProvider<CanteenViewModel>(
          create: (_) => CanteenViewModel(catalogItems: items),
        ),
      ],
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
        final activeTheme = themeProvider.currentTheme;
        final colorScheme = activeTheme.colorScheme;
        final isDark = colorScheme.brightness == Brightness.dark;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.lightThemeData,
          darkTheme: themeProvider.darkThemeData,
          themeMode: themeProvider.themeMode,
          title: "VIT Bhopal Mess",
          home: EasySplashScreen(
            logo: Image.asset('assets/images/icon_circle.png'),
            logoWidth: 90,
            title: Text(
              "VIT Bhopal Mess",
              style: TextStyle(
                fontSize: 28,
                color: isDark ? colorScheme.onSurface : colorScheme.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
            backgroundColor: colorScheme.surface,
            showLoader: false,
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
        ).animate().fadeIn(duration: 400.ms);
      },
    );
  }
}

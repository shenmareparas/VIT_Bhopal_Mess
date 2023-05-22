import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vit_bhopal_mess/provider/theme_provider.dart';
import 'package:vit_bhopal_mess/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeProvider themeProvider = ThemeProvider();
  await themeProvider.initializeTheme();
  runApp(
    ChangeNotifierProvider<ThemeProvider>.value(
      value: themeProvider,
      child: const MyApp(),
    ),
  );
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
          home: const HomeScreen(),
        );
      },
    );
  }
}

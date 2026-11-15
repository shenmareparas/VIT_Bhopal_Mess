import 'package:animate_do/animate_do.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:vit_bhopal_mess/provider/mess_provider.dart';
import 'package:vit_bhopal_mess/provider/theme_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final messProvider = Provider.of<MessProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 400),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RadioGroup<int>(
                    groupValue: messProvider.selectedMess,
                    onChanged: (value) {
                      if (value != null) {
                        messProvider.setSelectedMess(value);
                      }
                    },
                    child: const Column(
                      children: [
                        Text(
                          'Choose Mess',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        RadioListTile.adaptive(
                          title: Text('Boys Hostel 1 CRCL Mess'),
                          value: 1,
                        ),
                        RadioListTile.adaptive(
                          title: Text('Boys Hostel 2 & 3 Mayuri Mess'),
                          value: 2,
                        ),
                        RadioListTile.adaptive(
                          title: Text('Boys Hostel 6 Safal Mess'),
                          value: 4,
                        ),
                        RadioListTile.adaptive(
                          title: Text('Girls Hostel AB Mess'),
                          value: 3,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Note: Mess menu updates automatically',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeInUp(
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 200),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'App Theme',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ListTile(
                        title: const Text('Dark Mode'),
                        trailing: Switch.adaptive(
                          value:
                              themeProvider.currentThemeType == ThemeType.dark,
                          onChanged: (_) {
                            themeProvider.toggleTheme();
                          },
                        ),
                        onTap: () {
                          themeProvider.toggleTheme();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

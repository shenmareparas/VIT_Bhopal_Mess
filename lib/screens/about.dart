import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About',
            style: TextStyle(
              fontSize: 25,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 130,
                  backgroundImage: AssetImage('assets/images/icon.png'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'VIT Mess',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'v1.0.1',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "This app aims to make it easier for\nVIT Bhopal University Students\nto find the correct food item\navailable at the mess based on\nthe current day and time",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Developed by Paras Shenmare\n Made with 💚 in Flutter',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    String email = 'shenmareparas+vitbmess@gmail.com';
                    String message = 'VIT Bhopal Mess Feedback';
                    String mailto =
                        Uri.encodeFull('mailto:$email?body=$message');
                    launchUrlString(mailto);
                  },
                  child: const Text('Send Feedback'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

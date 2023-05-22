import 'package:flutter/material.dart';

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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 130,
                backgroundImage: AssetImage('assets/images/icon.png'),
              ),
              SizedBox(height: 20),
              Text(
                'VIT Mess',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'v1.0.1',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "This app aims to make it easier for\nVIT Bhopal University Students\nto find the correct food item\navailable at the mess based on\nthe current day and time",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Developed by Paras Shenmare',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'shenmareparas@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'VIT Bhopal Mess',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: PhotoView(
          imageProvider: const AssetImage('assets/images/timetable.jpg'),
        ),
      ),
    );
  }
}

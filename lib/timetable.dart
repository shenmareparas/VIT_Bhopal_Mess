import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Timetable extends StatelessWidget {
  const Timetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: const AssetImage('assets/images/timetable.jpg'),
      ),
    );
  }
}

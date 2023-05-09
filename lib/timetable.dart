import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'settings.dart';

class Timetable extends StatefulWidget {
  const Timetable({super.key});

  @override
  State<Timetable> createState() => TimetableState();
}

class TimetableState extends State<Timetable> {
  String img = 'assets/images/$selectedMess.timetable.jpg';

void updateImage(){
  setState(() {
    img = 'assets/images/$selectedMess.timetable.jpg';
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: AssetImage(img),
      ),
    );
  }
}

import 'package:color_chair_ui/detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//devDiariesWithVee on Instagram
//devDiariesWithVee on Youtube
//vaidehi2701 on Github

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Chair',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DetailScreen(),
    );
  }
}

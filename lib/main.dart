import 'package:flutter/material.dart';
import 'package:interview/feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mars Rover Photos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FeedPage(),
    );
  }
}

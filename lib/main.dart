import 'package:flutter/material.dart';
import 'package:interview/screens/feed.dart';
import 'package:interview/providers/photo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PhotoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Mars Rover Photos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FeedPage(),
      ),
    );
  }
}

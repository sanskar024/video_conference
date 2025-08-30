import 'package:flutter/material.dart';
import 'package:video_conference/screens/home.dart';
import 'package:video_conference/screens/login_page.dart';
import 'package:video_conference/utils/color.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // very important
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video  conference',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:backgroundColor,
      ),
      home:Home(),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:linkaja_ui/screens/history_page.dart';
import 'package:linkaja_ui/screens/home_page.dart';
import 'package:linkaja_ui/screens/profile_page.dart';
import 'package:linkaja_ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false, // Hilangkan banner debug
      title: 'Link Aja Clone',
      theme: ThemeData(
        primarySwatch: Colors.red, // Sesuaikan tema
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/history': (context) => HistoryPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
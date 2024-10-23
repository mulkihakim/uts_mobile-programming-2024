import 'dart:async';
import 'package:flutter/material.dart';
import 'package:linkaja_ui/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigasi ke halaman Home setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Ganti dengan HomePage Anda
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row untuk menempatkan dua logo bersebelahan
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo LinkAja
                Image.asset(
                  'assets/images/linkaja_logo.png',
                  width: 100, // Atur ukuran sesuai kebutuhan
                  height: 100,
                ),
                const SizedBox(width: 20), // Spasi antara kedua logo
                // Logo LinkAja Syariah
                Image.asset(
                  'assets/images/linkaja_syariah_logo.png',
                  width: 180, // Atur ukuran sesuai kebutuhan
                  height: 180,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'PeDe #APA² BISA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
